//
//  MeteoritesMapViewModel.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import CoreLocation
import Location
import MapKit
import SwiftUI

@Observable
final class MeteoritesMapViewModel: MeteoritesMapViewModelProtocol {
    @ObservationIgnored
    let services: Services
    
    var dataState: DataState<[MeteoriteDecorator]> = .loading
    var position: MapCameraPosition
    var showAuthorizationButton: Bool
    
    private var currentLocation: CLLocationCoordinate2D
    private let locationManager: UserLocationManager
    
    init(services: Services) {
        let location = UserLocationManager()
        
        self.services = services
        
        self.currentLocation = services.configuration.initialLocation
        self.position = MapCameraPosition.region(
            MKCoordinateRegion(
                center: services.configuration.initialLocation,
                span: MKCoordinateSpan(latitudeDelta: 1.4551085, longitudeDelta: 3.8614245)
            )
        )
        
        self.showAuthorizationButton = !location.hasAuthorization
        self.locationManager = location
        
        location.onAuthorizationChange = { [weak self] in
            self?.showAuthorizationButton = !$0
        }
        
        #warning("Check whether the location services are enabled.")
        
        location.onLocationChange = { [weak self] in
            self?.updateLocation($0)
        }
        
        #warning("Stop location updates when the user moves to a different view.")
    }
    
    private func updateLocation(_ coordinate: CLLocationCoordinate2D) {
        currentLocation = coordinate
        
        position = MapCameraPosition.region(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.75, longitudeDelta: 0.75)
            )
        )
        
        Task {
            await loadMeteorites()
        }
    }
    
    func loadMeteorites() async {
        do {
            let meteorites = try await services.apiService.getMeteorites(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
            
            // For simplicity I'm not using meteorites that are missing mass, date or location.
            let filteredMeteorites = meteorites.compactMap { MeteoriteDecorator(meteorite: $0) }
            
            dataState = .loaded(filteredMeteorites)
        } catch {
            dataState = .error(error)
        }
    }
    
    func askForLocationAuthorization() {
        #warning("When asking for the second time, prompt the user to allow location in the Settings.")
        
        locationManager.askForLocationAuthorization()
    }
}

extension MeteoritesMapViewModel {
    static var mocked: MeteoritesMapViewModel {
        MeteoritesMapViewModel(services: .mocked)
    }
}


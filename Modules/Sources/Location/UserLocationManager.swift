//
//  UserLocationManager.swift
//  Modules
//
//  Created by Adam Konečný on 26.11.2024.
//

import CoreLocation

public final class UserLocationManager: NSObject {
    public typealias OnAuthorizationChange = (Bool) -> Void
    public typealias OnLocationChange = (CLLocationCoordinate2D) -> Void
    
    private var _hasAuthorization: Bool
    
    public var hasAuthorization: Bool {
        _hasAuthorization
    }
    
    public var onAuthorizationChange: OnAuthorizationChange?
    public var onLocationChange: OnLocationChange?
    
    private let locationManager: CLLocationManager
    
    public override init() {
        self._hasAuthorization = false
        
        self.locationManager = CLLocationManager()
        
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    public func askForLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
}

extension UserLocationManager: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        _hasAuthorization = status == .authorizedAlways || status == .authorizedWhenInUse
        
        onAuthorizationChange?(hasAuthorization)
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {
            return
        }
        
        onLocationChange?(lastLocation.coordinate)
    }
}

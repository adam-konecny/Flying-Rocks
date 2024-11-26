//
//  MeteoritesMapViewModel.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import SwiftUI

@Observable
final class MeteoritesMapViewModel: MeteoritesMapViewModelProtocol {
    @ObservationIgnored
    let services: Services
    
    var dataState: DataState<[MeteoriteDecorator]> = .loading
    
    init(services: Services) {
        self.services = services
    }
    
    func loadMeteorites() async {
        do {
            let meteorites = try await services.apiService.getMeteorites(page: .init(limit: 200, offset: 0)).data
            
            // For simplicity I'm not using meteorites that are missing mass, date or location.
            let filteredMeteorites = meteorites.compactMap { MeteoriteDecorator(meteorite: $0) }
            
            dataState = .loaded(filteredMeteorites)
        } catch {
            dataState = .error(error)
        }
    }
}

extension MeteoritesMapViewModel {
    static var mocked: MeteoritesMapViewModel {
        MeteoritesMapViewModel(services: .mocked)
    }
}

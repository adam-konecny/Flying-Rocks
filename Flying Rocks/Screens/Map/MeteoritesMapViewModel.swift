//
//  MeteoritesMapViewModel.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import SwiftUI

@Observable
class MeteoritesMapViewModel: ViewModel {
    @ObservationIgnored
    let services: any ServicesProtocol
    
    var dataState: DataState<[MeteoriteFormatter]> = .loading
    
    init(services: any ServicesProtocol) {
        self.services = services
    }
    
    func loadMeteorites() async {
        do {
            let meteorites = try await services.apiService.getMeteorites(page: .init(limit: 200, offset: 0)).data
            
            // For simplicity I'm not using meteorites that are missing mass, date or location.
            let filteredMeteorites = meteorites.compactMap { MeteoriteFormatter(meteorite: $0) }
            
            dataState = .loaded(filteredMeteorites)
        } catch {
            dataState = .error(error)
        }
    }
}

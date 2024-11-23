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
    
    var dataState: DataState<[Meteorite]> = .loading
    
    init(services: any ServicesProtocol) {
        self.services = services
    }
    
    func didAppear() {
        Task {
            await loadMeteorites()
        }
    }
    
    private func loadMeteorites() async {
        do {
            let meteorites = try await services.apiService.getMeteorites(page: .default).data
            
            dataState = .loaded(meteorites)
        } catch {
            dataState = .error(error)
        }
    }
}

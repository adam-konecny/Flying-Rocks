//
//  MeteoritesListViewModel.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import SwiftUI

@Observable
class MeteoritesListViewModel: ViewModel {
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
    
    func refresh() async {
        await loadMeteorites()
    }
    
    private func loadMeteorites() async {
        do {
            let meteorites = try await services.apiService.getMeteorites()
            
            dataState = .loaded(meteorites)
        } catch {
            dataState = .error(error)
        }
    }
}
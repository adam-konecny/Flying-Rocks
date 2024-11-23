//
//  SpellsListViewModel.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import SwiftUI

@Observable
class SpellsListViewModel: ViewModel {
    @ObservationIgnored
    let services: any ServicesProtocol
    
    var dataState: DataState<[Spell]> = .loading
    
    init(services: any ServicesProtocol) {
        self.services = services
    }
    
    func didAppear() {
        Task {
            await loadSpells()
        }
    }
    
    private func loadSpells() async {
        do {
            let spells = try await services.apiService.getSpells()
            
            dataState = .loaded(spells)
        } catch {
            dataState = .error(error)
        }
    }
}

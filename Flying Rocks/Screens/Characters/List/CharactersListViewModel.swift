//
//  CharactersListViewModel.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 06.11.2024.
//

import SwiftUI

@Observable
class CharactersListViewModel: ViewModel {
    @ObservationIgnored
    let services: any ServicesProtocol
    
    var dataState: DataState<[Person]> = .loading
    
    init(services: any ServicesProtocol) {
        self.services = services
    }
    
    func didAppear() {
        Task {
            await loadCharacters()
        }
    }
    
    func refresh() async {
        await loadCharacters()
    }
    
    private func loadCharacters() async {
        do {
            let characters = try await services.apiService.getCharacters()
            
            dataState = .loaded(characters)
        } catch {
            dataState = .error(error)
        }
    }
}

//
//  CharacterDetailViewModel.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import SwiftUI

@Observable
class CharacterDetailViewModel: ViewModel {
    @ObservationIgnored
    let services: any ServicesProtocol
    
    @ObservationIgnored
    let character: Person
    
    init(services: any ServicesProtocol, character: Person) {
        self.services = services
        self.character = character
    }
}

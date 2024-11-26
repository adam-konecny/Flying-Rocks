//
//  MeteoriteDetailViewModel.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import SwiftUI

@Observable
final class MeteoriteDetailViewModel: MeteoriteDetailViewModelProtocol {
    @ObservationIgnored
    let services: Services
    
    @ObservationIgnored
    let meteorite: MeteoriteDecorator
    
    init(services: Services, meteorite: MeteoriteDecorator) {
        self.services = services
        self.meteorite = meteorite
    }
}

extension MeteoriteDetailViewModel {
    static var mocked: MeteoriteDetailViewModel {
        MeteoriteDetailViewModel(services: .mocked, meteorite: .mocked)
    }
}

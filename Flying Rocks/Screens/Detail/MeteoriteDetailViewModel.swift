//
//  MeteoriteDetailViewModel.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import SwiftUI

@Observable
class MeteoriteDetailViewModel: ViewModel {
    @ObservationIgnored
    let services: any ServicesProtocol
    
    @ObservationIgnored
    let meteorite: Meteorite
    
    init(services: any ServicesProtocol, meteorite: Meteorite) {
        self.services = services
        self.meteorite = meteorite
    }
}

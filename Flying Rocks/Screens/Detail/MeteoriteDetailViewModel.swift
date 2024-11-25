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
    let meteorite: MeteoriteFormatter
    
    init(services: any ServicesProtocol, meteorite: MeteoriteFormatter) {
        self.services = services
        self.meteorite = meteorite
    }
}

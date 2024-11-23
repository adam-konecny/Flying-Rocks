//
//  Services.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 06.11.2024.
//

import Foundation

class Services: ServicesProtocol {
    let apiService: APIService
    
    init(configuration: Configuration) {
        self.apiService = APIService(
            configuration: configuration
        )
    }
}

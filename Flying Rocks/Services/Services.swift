//
//  Services.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 06.11.2024.
//

import Foundation

final class Services {
    let configuration: Configuration
    let apiService: APIServiceProtocol
    
    private init(configuration: Configuration, apiService: APIServiceProtocol) {
        self.configuration = configuration
        self.apiService = apiService
    }
    
    init(configuration: Configuration) {
        self.configuration = configuration
        self.apiService = APIService(
            configuration: configuration
        )
    }
}

extension Services {
    static var mocked: Services {
        .init(
            configuration: .production,
            apiService: MockedAPIService()
        )
    }
}

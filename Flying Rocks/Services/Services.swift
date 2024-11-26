//
//  Services.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 06.11.2024.
//

import Foundation

final class Services {
    let apiService: APIServiceProtocol
    
    private init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    init(configuration: Configuration) {
        self.apiService = APIService(
            configuration: configuration
        )
    }
}

extension Services {
    static var mocked: Services {
        .init(apiService: MockedAPIService())
    }
}

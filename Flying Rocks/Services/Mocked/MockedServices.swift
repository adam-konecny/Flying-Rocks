//
//  MockedServices.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

class MockedServices: ServicesProtocol {
    let apiService: MockedAPIService
    
    init() {
        self.apiService = MockedAPIService()
    }
}

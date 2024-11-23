//
//  MockedAPIService.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

class MockedAPIService: APIServiceProtocol {
    func getMeteorites() async throws -> [Meteorite] {
        [
            .random,
            .random,
            .random,
            .random
        ]
    }
}

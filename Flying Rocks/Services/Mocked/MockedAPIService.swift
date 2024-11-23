//
//  MockedAPIService.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

class MockedAPIService: APIServiceProtocol {
    func getCharacters() async throws -> [Person] {
        [
            .random,
            .random,
            .random,
            .random
        ]
    }
    
    func getSpells() async throws -> [Spell] {
        [
            .random,
            .random,
            .random,
            .random
        ]
    }
}

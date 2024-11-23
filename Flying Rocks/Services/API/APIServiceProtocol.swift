//
//  APIServiceProtocol.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

protocol APIServiceProtocol {
    func getCharacters() async throws -> [Person]
    func getSpells() async throws -> [Spell]
}

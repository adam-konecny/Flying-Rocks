//
//  APIServiceProtocol.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

protocol APIServiceProtocol {
    func getMeteorites() async throws -> [Meteorite]
}

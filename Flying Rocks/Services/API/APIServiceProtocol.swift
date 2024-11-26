//
//  APIServiceProtocol.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

protocol APIServiceProtocol {
    func getMeteorites(page: Pagination) async throws -> PaginatedList<Meteorite>
    func getMeteorites(latitude: Double, longitude: Double) async throws -> [Meteorite]
}

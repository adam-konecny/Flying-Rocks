//
//  MockedAPIService.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

class MockedAPIService: APIServiceProtocol {
    func getMeteorites(page: Pagination) async throws -> PaginatedList<Meteorite> {
        let data: [Meteorite] = [
            .random,
            .random,
            .random,
            .random
        ]
        
        return PaginatedList(
            data: data,
            currentPage: page
        )
    }
}

//
//  MockedAPIService.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

final class MockedAPIService: APIServiceProtocol {
    func getMeteorites(page: Pagination) async throws -> PaginatedList<Meteorite> {
        let data: [Meteorite] = [
            .mocked,
            .mocked,
            .mocked,
            .mocked
        ]
        
        return PaginatedList(
            data: data,
            currentPage: page
        )
    }
}

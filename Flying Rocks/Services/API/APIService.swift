//
//  APIService.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 06.11.2024.
//

import Alamofire
import Helpers
import Foundation

final class APIService: APIServiceProtocol {
    let configuration: Configuration
    
    private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .formatted(.apiDate)
        
        return decoder
    }()
    
    init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    private func makeRequest<T: Decodable>(url: String, type: T.Type) async throws -> T {
        let reponse = await AF.request(url)
            .validate()
            .serializingDecodable(T.self, decoder: decoder)
            .response
        
        switch reponse.result {
        case .success(let value):
            return value
        case .failure:
            throw reponse.error ?? AppError.unknownError
        }
    }
    
    private func buildURL(page: Pagination, location: Location?) -> String {
        var url = configuration.baseUrl + "?$limit=\(page.limit)&$offset=\(page.offset)"
        
        if let location {
            url += "&$where=within_circle(geolocation, \(location.latitude), \(location.longitude), 300000)"
        }
        
        return url
    }
    
    func getMeteorites(page: Pagination) async throws -> PaginatedList<Meteorite> {
        let data = try await makeRequest(
            url: buildURL(page: page, location: nil),
            type: [Meteorite].self
        )
        
        return PaginatedList(
            data: data,
            currentPage: page
        )
    }
    
    func getMeteorites(latitude: Double, longitude: Double) async throws -> [Meteorite] {
        try await makeRequest(
            url: buildURL(
                page: .init(limit: 50, offset: 0),
                location: .init(latitude: latitude, longitude: longitude)
            ),
            type: [Meteorite].self
        )
    }
}

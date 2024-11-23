//
//  APIService.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 06.11.2024.
//

import Alamofire
import Helpers
import Foundation

class APIService: APIServiceProtocol {
    let configuration: Configuration
    
    private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .custom{ decoder -> Date in
            let container = try decoder.singleValueContainer()
            
            let dateString = try container.decode(String.self)
            
            guard let date = dateString.date(with: .apiDate) else {
                throw AppError.wrongDateFormat
            }
            
            return date
        }
        
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
    
    private func buildURL(page: Pagination) -> String {
        configuration.baseUrl + "?$limit=\(page.limit)&$offset=\(page.offset)"
    }
    
    func getMeteorites(page: Pagination) async throws -> PaginatedList<Meteorite> {
        let data = try await makeRequest(
            url: buildURL(page: page),
            type: [Meteorite].self
        )
        
        return PaginatedList(
            data: data,
            currentPage: page
        )
    }
}

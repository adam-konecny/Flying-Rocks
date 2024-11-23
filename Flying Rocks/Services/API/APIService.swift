//
//  APIService.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 06.11.2024.
//

import Alamofire
import Foundation

class APIService: APIServiceProtocol {
    let configuration: Configuration
    
    private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .custom{ decoder -> Date in
            let container = try decoder.singleValueContainer()
            
            let dateString = try container.decode(String.self)
            
            guard let date = dateString.date(with: .server) else {
                throw AppError.wrongDateFormat
            }
            
            return date
        }
        
        return decoder
    }()
    
    init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    private func makeRequest<T: Decodable>(endpoint: String, type: T.Type) async throws -> T {
        let reponse = await AF.request(configuration.baseUrl + endpoint)
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
    
    func getCharacters() async throws -> [Person] {
        try await makeRequest(
            endpoint: configuration.endpoints.characters,
            type: [Person].self
        )
    }
    
    func getSpells() async throws -> [Spell] {
        try await makeRequest(
            endpoint: configuration.endpoints.spells,
            type: [Spell].self
        )
    }
}

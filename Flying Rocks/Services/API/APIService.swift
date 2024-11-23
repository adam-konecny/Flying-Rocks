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
    
    func getMeteorites() async throws -> [Meteorite] {
        try await makeRequest(
            endpoint: configuration.endpoints.meteorites,
            type: [Meteorite].self
        )
    }
}

//
//  Meteorite.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import Foundation

struct Meteorite: Decodable {
    let id: String
    let name: String
    let mass: Double?
    let date: Date?
    let location: Location?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case mass
        case date = "year"
        case latitude = "reclat"
        case longitude = "reclong"
    }
    
    init(id: String, name: String, mass: Double, date: Date, latitude: Double, longitude: Double) {
        self.id = id
        self.name = name
        self.mass = mass
        self.date = date
        self.location = Location(
            latitude: latitude,
            longitude: longitude
        )
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        
        if let mass = try container.decodeIfPresent(String.self, forKey: .mass) {
            self.mass = try NumberFormatter.double(from: mass)
        } else {
            self.mass = nil
        }
        
        self.date = try container.decodeIfPresent(Date.self, forKey: .date)
        
        if let latitude = try container.decodeIfPresent(String.self, forKey: .latitude), let longitude = try container.decodeIfPresent(String.self, forKey: .longitude) {
            self.location = Location(
                latitude: try NumberFormatter.double(from: latitude),
                longitude: try NumberFormatter.double(from: longitude)
            )
        } else {
            self.location = nil
        }
    }
}

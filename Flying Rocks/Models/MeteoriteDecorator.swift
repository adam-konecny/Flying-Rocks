//
//  MeteoriteDecorator.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 24.11.2024.
//

import Foundation
import Helpers
import MapKit

struct MeteoriteDecorator: Identifiable, Hashable {
    let id: String
    let name: String
    let mass: String
    let date: String
    let coordinate: CLLocationCoordinate2D
    let readableCoordinates: LocalizedStringResource
    
    init?(meteorite: Meteorite) {
        guard let mass = meteorite.mass else {
            return nil
        }
        
        guard let date = meteorite.date?.string(with: .dayMonthYear) else {
            return nil
        }
        
        guard let location = meteorite.location else {
            return nil
        }
        
        self.id = meteorite.id
        self.name = meteorite.name
        self.mass = MeasurementFormatter.meteoriteWeight(fromGrams: mass)
        self.date = date
        
        let coordinate = CLLocationCoordinate2D(
            latitude: location.latitude,
            longitude: location.longitude
        )
        
        self.coordinate = coordinate
        self.readableCoordinates = CoordinatesToDMS.readable(from: coordinate)
    }
    
    static func == (lhs: MeteoriteDecorator, rhs: MeteoriteDecorator) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(mass)
        hasher.combine(date)
    }
}

extension MeteoriteDecorator {
    static var mocked: MeteoriteDecorator {
        .init(meteorite: .mocked)!
    }
}

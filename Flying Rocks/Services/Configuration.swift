//
//  Configuration.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import MapKit

struct Configuration {
    let baseUrl: String
    let initialLocation: CLLocationCoordinate2D
    
    static var production: Configuration {
        .init(
            baseUrl: "https://data.nasa.gov/resource/gh4g-9sfh.json",
            initialLocation: .init(latitude: 49.5894325, longitude: 15.3150675)
        )
    }
}

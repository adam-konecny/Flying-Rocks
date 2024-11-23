//
//  Configuration.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

struct Endpoints {
    let meteorites: String
}

// https://github.com/fedeperin/potterapi?ref=public_apis
struct Configuration {
    let baseUrl: String
    let endpoints: Endpoints
    
    static var production: Configuration {
        .init(
            baseUrl: "https://data.nasa.gov/resource/gh4g-9sfh.json",
            endpoints: .init(
                meteorites: "/en/characters"
            )
        )
    }
}

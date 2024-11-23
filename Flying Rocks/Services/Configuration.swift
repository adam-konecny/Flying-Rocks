//
//  Configuration.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

struct Endpoints {
    let characters: String
    let spells: String
}

// https://github.com/fedeperin/potterapi?ref=public_apis
struct Configuration {
    let baseUrl: String
    let endpoints: Endpoints
    
    static var production: Configuration {
        .init(
            baseUrl: "https://potterapi-fedeperin.vercel.app",
            endpoints: .init(
                characters: "/en/characters",
                spells: "/en/spells"
            )
        )
    }
}

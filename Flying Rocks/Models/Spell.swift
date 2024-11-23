//
//  Spell.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import Foundation

struct Spell: Decodable, Hashable {
    let name: String
    let use: String
    
    enum CodingKeys: String, CodingKey {
        case name = "spell"
        case use
    }
    
    static var random: Self {
        .init(
            name: [
                "Apple",
                "Orange",
                "Banana"
            ].randomElement()!,
            use: [
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                "Sed dictum semper pharetra. Phasellus at risus eget nisi varius varius.",
                "Nullam lacinia placerat accumsan. Maecenas sed maximus nulla."
            ].randomElement()!
        )
    }
}

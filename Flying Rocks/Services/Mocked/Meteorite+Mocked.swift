//
//  Meteorite+Mocked.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 26.11.2024.
//

import Foundation

extension Meteorite {
    static var mocked: Self {
        .init(
            id: UUID().uuidString,
            name: [
                "Apple",
                "Orange",
                "Eggplant",
                "Banana",
                "Watermelon",
                "Pineapple"
            ].randomElement()!,
            mass: Double.random(in: (200.0...50_000.0)),
            date: Date(timeIntervalSinceNow: -Double.random(in: 50_000...1_500_000)),
            latitude: 49.194797 + Double.random(in: -1.5...1.5),
            longitude: 16.6079453 + Double.random(in: -1.5...1.5)
        )
    }
}

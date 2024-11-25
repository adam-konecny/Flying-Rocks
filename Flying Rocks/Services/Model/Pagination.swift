//
//  Pagination.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import Foundation

struct Pagination {
    let limit: Int
    let offset: Int
    
    static var `default`: Self {
        .init(
            limit: 20,
            offset: 0
        )
    }
}

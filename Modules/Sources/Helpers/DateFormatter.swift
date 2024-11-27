//
//  DateFormatter.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import Foundation

public extension DateFormatter {
    // For extracting dates from the API.
    static let apiDate: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.sss"
        
        return formatter
    }()
}

//
//  DateFormatter.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import Foundation

extension DateFormatter {
    static let server: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MMM d, yyyy"
        
        return formatter
    }()
    
    static let dayMonthYear: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "dMMMMyyyy", options: 0, locale: .current)
        
        return formatter
    }()
}

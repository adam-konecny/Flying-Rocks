//
//  NumberFormatter.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import Foundation

public extension NumberFormatter {
    private static let numberFormatterForExtraction: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.locale = .current
        formatter.usesGroupingSeparator = false
        
        return formatter
    }()
    
    static func number(from string: String) throws -> NSNumber {
        numberFormatterForExtraction.decimalSeparator = "."
        
        if let number = numberFormatterForExtraction.number(from: string) {
            return number
        }
        
        numberFormatterForExtraction.decimalSeparator = ","

        if let number = numberFormatterForExtraction.number(from: string) {
            return number
        }
        
        throw CustomError.wrongNumberFormat
    }
    
    static func double(from string: String) throws -> Double {
        (try number(from: string)).doubleValue
    }
    
    static func integer(from string: String) throws -> Int {
        (try number(from: string)).intValue
    }
}

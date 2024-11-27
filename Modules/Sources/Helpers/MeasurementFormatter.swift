//
//  MeasurementFormatter.swift
//  Modules
//
//  Created by Adam Konečný on 24.11.2024.
//

import Foundation

public extension MeasurementFormatter {
    nonisolated(unsafe) static let meteoriteFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        
        formatter.unitStyle = .short
        formatter.unitOptions = .naturalScale
        
        return formatter
    }()
    
    static func meteoriteWeight(fromGrams grams: Double) -> String {
        let measurement = Measurement(value: grams, unit: UnitMass.grams)
        
        return meteoriteFormatter.string(from: measurement)
    }
}

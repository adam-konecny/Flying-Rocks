//
//  Date.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//


import Foundation

public extension Date {
    func string(with format: DateFormatter) -> String {
        format.string(from: self)
    }
}

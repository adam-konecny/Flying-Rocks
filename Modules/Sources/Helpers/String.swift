//
//  String.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import Foundation

public extension String {
    func date(with format: DateFormatter) -> Date? {
        format.date(from: self)
    }
}

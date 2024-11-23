//
//  Errors.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 06.11.2024.
//

import Foundation

enum AppError: Error {
    case unknownError
    case wrongDateFormat
    case wrongNumberFormat
}

extension AppError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknownError:
            return "Unknown error!"
        case .wrongDateFormat:
            return "Date format is wrong!"
        case .wrongNumberFormat:
            return "Number format is wrong!"
        }
    }
}

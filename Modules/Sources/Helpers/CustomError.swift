//
//  CustomError.swift
//  Modules
//
//  Created by Adam Konečný on 23.11.2024.
//

import Foundation

enum CustomError: Error {
    case wrongNumberFormat
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .wrongNumberFormat:
            return "Number format is wrong!"
        }
    }
}

//
//  DataState.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 06.11.2024.
//

import Foundation

enum DataState<T> {
    case loading
    case loaded(T)
    case error(Error)
}

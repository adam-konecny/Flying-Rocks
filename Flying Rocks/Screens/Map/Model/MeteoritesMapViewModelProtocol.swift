//
//  MeteoritesMapViewModelProtocol.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 26.11.2024.
//

protocol MeteoritesMapViewModelProtocol {
    var dataState: DataState<[MeteoriteDecorator]> { get }
    
    func loadMeteorites() async
}

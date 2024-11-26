//
//  MeteoritesMapViewModelProtocol.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 26.11.2024.
//

import MapKit
import SwiftUI

protocol MeteoritesMapViewModelProtocol {
    var dataState: DataState<[MeteoriteDecorator]> { get }
    var position: MapCameraPosition { get set }
    var showAuthorizationButton: Bool { get }
    
    func loadMeteorites() async
    func askForLocationAuthorization()
}

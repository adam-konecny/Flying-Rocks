//
//  FlyingRocksApp.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import SwiftUI

@main
struct FlyingRocksApp: App {
    @State private var services = Services(configuration: .production)
    
    var body: some Scene {
        WindowGroup {
            BaseTabView(services: services)
        }
    }
}

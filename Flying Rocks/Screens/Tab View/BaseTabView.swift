//
//  BaseTabView.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import SwiftUI

struct BaseTabView: View {
    let services: Services
    
    var body: some View {
        TabView {
            MeteoritesList(viewModel: MeteoritesListViewModel(services: services))
                .tabItem {
                    Label {
                        Text("Meteorites")
                    } icon: {
                        Image(.tabFire24)
                    }
                }
            
            MeteoritesMap(viewModel: MeteoritesMapViewModel(services: services))
                .tabItem {
                    Label {
                        Text("Map")
                    } icon: {
                        Image(.tabMap24)
                    }
                }
        }
    }
}

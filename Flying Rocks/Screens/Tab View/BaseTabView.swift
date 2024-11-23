//
//  BaseTabView.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import SwiftUI

struct BaseTabView: View {
    let services: any ServicesProtocol
    
    var body: some View {
        TabView {
            CharactersList(viewModel: CharactersListViewModel(services: services))
                .tabItem {
                    Label {
                        Text("Characters")
                    } icon: {
                        Image(systemName: "person.3.fill")
                    }
                }
            
            SpellsList(viewModel: SpellsListViewModel(services: services))
                .tabItem {
                    Label {
                        Text("Spells")
                    } icon: {
                        Image(systemName: "wand.and.sparkles")
                    }
                }
        }
    }
}

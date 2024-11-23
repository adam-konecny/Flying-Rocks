//
//  SpellsList.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import SwiftUI

struct SpellsList: View {
    @State var viewModel: SpellsListViewModel
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            Group {
                switch viewModel.dataState {
                case .loading:
                    ProgressView()
                case .loaded(let spells):
                    ScrollView {
                        LazyVStack(spacing: 16.0) {
                            ForEach(spells, id: \.self) { spell in
                                SpellListItem(spell: spell)
                            }
                        }
                        .padding()
                    }
                case .error(let error):
                    Text(error.localizedDescription)
                }
            }
            .navigationTitle("Spells")
        }
        .onAppear {
            viewModel.didAppear()
        }
    }
}

#Preview {
    SpellsList(
        viewModel: .init(
            services: MockedServices()
        )
    )
}

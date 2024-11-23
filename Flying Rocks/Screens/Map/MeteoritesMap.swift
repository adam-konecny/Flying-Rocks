//
//  MeteoritesMap.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import SwiftUI

struct MeteoritesMap: View {
    @State var viewModel: MeteoritesMapViewModel
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            Group {
                switch viewModel.dataState {
                case .loading:
                    loadingView
                case .loaded(let meteorites):
                    loadedView(meteorites)
                case .error(let error):
                    errorView(error)
                }
            }
            .navigationTitle("Meteorites")
        }
        .onAppear {
            viewModel.didAppear()
        }
    }
    
    private var loadingView: some View {
        ProgressView()
    }
    
    private func loadedView(_ meteorites: [Meteorite]) -> some View {
        ScrollView {
            LazyVStack(spacing: 24.0) {
                ForEach(meteorites, id: \.self) { meteorite in
                    NavigationLink(value: meteorite) {
                        MeteoriteListItem(meteorite: meteorite)
                    }
                }
            }
            .padding()
        }
        .refreshable {
            await viewModel.refresh()
        }
        .navigationDestination(for: Meteorite.self) { meteorite in
            MeteoriteDetail(
                viewModel: MeteoriteDetailViewModel(
                    services: viewModel.services,
                    meteorite: meteorite
                )
            )
        }
    }
    
    private func errorView(_ error: Error) -> some View {
        Text(error.localizedDescription)
            .padding()
    }
}

#Preview {
    MeteoritesMap(
        viewModel: .init(
            services: MockedServices()
        )
    )
}

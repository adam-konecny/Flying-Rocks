//
//  MeteoritesMap.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import MapKit
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
        .task {
            await viewModel.loadMeteorites()
        }
    }
    
    private var loadingView: some View {
        ProgressView()
    }
    
    private func loadedView(_ meteorites: [MeteoriteFormatter]) -> some View {
        Map {
            ForEach(meteorites) { meteorite in
                Marker(
                    meteorite.name,
                    coordinate: meteorite.coordinate
                )
            }
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

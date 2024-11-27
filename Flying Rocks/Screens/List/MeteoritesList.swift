//
//  MeteoritesList.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import SwiftUI

struct MeteoritesList: View {
    @State var viewModel: MeteoritesListViewModelProtocol
    @State private var navigationPath = NavigationPath()
    
    private let columns = [
        GridItem(.adaptive(minimum: 240.0), spacing: 12.0)
    ]
    
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
    
    private func loadedView(_ meteorites: [MeteoriteDecorator]) -> some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12.0) {
                ForEach(meteorites) { meteorite in
                    NavigationLink(value: meteorite) {
                        MeteoriteListItem(meteorite: meteorite)
                    }
                    .task {
                        await viewModel.loadMore(currentItem: meteorite)
                    }
                    .scrollTransition(axis: .vertical) {
                        content,
                        phase in
                        content.scaleEffect(
                            x: phase.isIdentity ? 1.0 : 0.8,
                            y: phase.isIdentity ? 1.0 : 0.8
                        )
                    }
                }
            }
            .padding()
        }
        .background(Color.background)
        .refreshable {
            await viewModel.refresh()
        }
        .navigationDestination(for: MeteoriteDecorator.self) { meteorite in
            viewModel.detailView(for: meteorite)
        }
    }
    
    private func errorView(_ error: Error) -> some View {
        Text(error.localizedDescription)
            .padding()
    }
}

#Preview("English") {
    MeteoritesList(
        viewModel: MeteoritesListViewModel.mocked
    )
}

#Preview("English Dark") {
    MeteoritesList(
        viewModel: MeteoritesListViewModel.mocked
    )
    .environment(\.colorScheme, .dark)
}

#Preview("Czech") {
    MeteoritesList(
        viewModel: MeteoritesListViewModel.mocked
    )
    .environment(\.locale, Locale(identifier: "cs"))
}

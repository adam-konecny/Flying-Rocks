//
//  CharactersList.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 06.11.2024.
//

import SwiftUI

struct CharactersList: View {
    @State var viewModel: CharactersListViewModel
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            Group {
                switch viewModel.dataState {
                case .loading:
                    loadingView
                case .loaded(let characters):
                    loadedView(characters)
                case .error(let error):
                    errorView(error)
                }
            }
            .navigationTitle("Characters")
        }
        .onAppear {
            viewModel.didAppear()
        }
    }
    
    private var loadingView: some View {
        ProgressView()
    }
    
    private func loadedView(_ characters: [Person]) -> some View {
        ScrollView {
            LazyVStack(spacing: 24.0) {
                ForEach(characters, id: \.self) { character in
                    NavigationLink(value: character) {
                        CharacterListItem(character: character)
                    }
                }
            }
            .padding()
        }
        .refreshable {
            await viewModel.refresh()
        }
        .navigationDestination(for: Person.self) { character in
            CharacterDetail(
                viewModel: CharacterDetailViewModel(
                    services: viewModel.services,
                    character: character
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
    CharactersList(
        viewModel: .init(
            services: MockedServices()
        )
    )
}

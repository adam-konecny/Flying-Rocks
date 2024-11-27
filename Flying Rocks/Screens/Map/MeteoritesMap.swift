//
//  MeteoritesMap.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import MapKit
import SwiftUI

struct MeteoritesMap: View {
    @State var viewModel: MeteoritesMapViewModelProtocol
    
    @State var selectedMeteorite: MeteoriteDecorator?
    
    var body: some View {
        ZStack {
            switch viewModel.dataState {
            case .loading:
                loadingView
            case .loaded(let meteorites):
                loadedView(meteorites)
            case .error(let error):
                errorView(error)
            }
            
            if viewModel.showAuthorizationButton {
                locationButton
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top)
            }
        }
        .sheet(item: $selectedMeteorite) {
            viewModel.detailView(for: $0)
                .presentationDetents([.medium, .large])
        }
        .task {
            await viewModel.loadMeteorites()
        }
    }
    
    private var loadingView: some View {
        ProgressView()
    }
    
    private func loadedView(_ meteorites: [MeteoriteDecorator]) -> some View {
        Map(position: $viewModel.position) {
            UserAnnotation()
            
            ForEach(meteorites) { meteorite in
                Annotation(meteorite.name, coordinate: meteorite.coordinate) {
                    Button {
                        selectedMeteorite = meteorite
                    } label: {
                        Text(meteorite.id)
                            .font(.body)
                            .bold()
                            .padding(6.0)
                            .background(.black)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                }
                .annotationTitles(.hidden)
            }
        }
    }
    
    private func errorView(_ error: Error) -> some View {
        Text(error.localizedDescription)
            .padding()
    }
    
    private var locationButton: some View {
        Button {
            viewModel.askForLocationAuthorization()
        } label: {
            Label(title: {
                Text("Enable location")
            }, icon: {
                Image(systemName: "location.fill")
            })
            .padding(8.0)
            .background(Color.blue)
            .foregroundStyle(Color.white)
            .clipShape(.capsule)
            .shadow(radius: 2.0)
        }
    }
}

#Preview {
    MeteoritesMap(
        viewModel: MeteoritesMapViewModel.mocked
    )
}

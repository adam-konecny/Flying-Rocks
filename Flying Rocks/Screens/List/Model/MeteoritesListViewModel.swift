//
//  MeteoritesListViewModel.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import SwiftUI

@Observable
final class MeteoritesListViewModel: MeteoritesListViewModelProtocol {
    @ObservationIgnored
    let services: Services
    
    var dataState: DataState<[MeteoriteDecorator]> = .loading
    
    private var nextPage: Pagination? = .default
    private var isLoadingMore: Bool = false
    
    init(services: Services) {
        self.services = services
    }
    
    func refresh() async {
        nextPage = .default
        isLoadingMore = false
        
        await loadMeteorites()
    }
    
    func loadMeteorites() async {
        guard let firstPage = nextPage else {
            return
        }
        
        do {
            let response = try await services.apiService.getMeteorites(page: firstPage)
            
            // For simplicity I'm not using meteorites that are missing mass, date or location.
            let filteredMeteorites = response.data.compactMap { MeteoriteDecorator(meteorite: $0) }
            
            dataState = .loaded(filteredMeteorites)
            nextPage = response.nextPage
        } catch {
            dataState = .error(error)
        }
    }
    
    func loadMore(currentItem: MeteoriteDecorator) async {
        guard case .loaded(let items) = dataState else {
            return
        }
        
        guard items.last == currentItem else {
            return
        }
        
        guard !isLoadingMore, let nextPage else {
            return
        }
        
        await startLoadingNextPage(nextPage)
    }
    
    private func startLoadingNextPage(_ nextPage: Pagination) async {
        isLoadingMore = true
        
        do {
            let response = try await services.apiService.getMeteorites(page: nextPage)
            
            guard case .loaded(let items) = dataState else {
                return
            }
            
            // For simplicity I'm not using meteorites that are missing mass, date or location.
            let filteredMeteorites = response.data.compactMap { MeteoriteDecorator(meteorite: $0) }
            
            dataState = .loaded(items + filteredMeteorites)
            self.nextPage = response.nextPage
        } catch {
//            dataState = .error(error)
            
            #warning("Show unobtrusive error.")
        }
        
        isLoadingMore = false
    }
    
    func detailView(for meteorite: MeteoriteDecorator) -> MeteoriteDetail {
        MeteoriteDetail(
            viewModel: MeteoriteDetailViewModel(
                services: services,
                meteorite: meteorite
            )
        )
    }
}

extension MeteoritesListViewModel {
    static var mocked: Self {
        .init(services: .mocked)
    }
}

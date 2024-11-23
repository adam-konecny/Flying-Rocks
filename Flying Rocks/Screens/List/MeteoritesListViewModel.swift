//
//  MeteoritesListViewModel.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import SwiftUI

@Observable
class MeteoritesListViewModel: ViewModel {
    @ObservationIgnored
    let services: any ServicesProtocol
    
    var dataState: DataState<[Meteorite]> = .loading
    
    private var nextPage: Pagination? = .default
    private var isLoadingMore: Bool = false
    
    init(services: any ServicesProtocol) {
        self.services = services
    }
    
    func didAppear() {
        Task {
            await loadMeteorites()
        }
    }
    
    func refresh() async {
        nextPage = .default
        isLoadingMore = false
        
        await loadMeteorites()
    }
    
    private func loadMeteorites() async {
        guard let firstPage = nextPage else {
            return
        }
        
        do {
            let response = try await services.apiService.getMeteorites(page: firstPage)
            
            dataState = .loaded(response.data)
            nextPage = response.nextPage
        } catch {
            dataState = .error(error)
        }
    }
    
    func loadMore(currentItem: Meteorite) {
        guard case .loaded(let items) = dataState else {
            return
        }
        
        guard items.last == currentItem else {
            return
        }
        
        guard !isLoadingMore, let nextPage else {
            return
        }
        
        Task {
            await startLoadingNextPage(nextPage)
        }
    }
    
    private func startLoadingNextPage(_ nextPage: Pagination) async {
        isLoadingMore = true
        
        do {
            let response = try await services.apiService.getMeteorites(page: nextPage)
            
            guard case .loaded(let items) = dataState else {
                return
            }
            
            dataState = .loaded(items + response.data)
            self.nextPage = response.nextPage
            
            isLoadingMore = false
        } catch {
            dataState = .error(error)
        }
    }
}

//
//  PaginatedList.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

struct PaginatedList<T> {
    let data: [T]
    let nextPage: Pagination?
    
    init(data: [T], currentPage: Pagination) {
        self.data = data
        
        if data.count >= currentPage.limit {
            self.nextPage = .init(
                limit: currentPage.limit,
                offset: currentPage.offset + currentPage.limit
            )
        } else {
            self.nextPage = nil
        }
    }
}

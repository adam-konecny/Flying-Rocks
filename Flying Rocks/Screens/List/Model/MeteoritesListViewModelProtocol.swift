//
//  MeteoritesListViewModelProtocol.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 26.11.2024.
//

import SwiftUI

protocol MeteoritesListViewModelProtocol {
    var dataState: DataState<[MeteoriteDecorator]> { get }
    
    func refresh() async
    func loadMeteorites() async
    func loadMore(currentItem: MeteoriteDecorator) async
    
    func detailView(for meteorite: MeteoriteDecorator) -> MeteoriteDetail
}

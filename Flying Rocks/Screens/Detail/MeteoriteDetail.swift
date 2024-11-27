//
//  MeteoriteDetail.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import Design
import Kingfisher
import SwiftUI

struct MeteoriteDetail: View {
    @State var viewModel: MeteoriteDetailViewModelProtocol
    @State var scrollViewOffsetY: Double = 0.0
    @State var imageWidth: Double = 320.0
    
    var body: some View {
        #warning("Fix: Navigation is too dark in contrast to the image")
        
        ScrollView {
            imageView
            
            VStack {
                MeteoriteInfoItemView(
                    image: "mappin.and.ellipse",
                    title: "Location",
                    value: viewModel.meteorite.readableCoordinates
                )
                
                MeteoriteInfoItemView(
                    image: "scalemass",
                    title: "Mass",
                    value: viewModel.meteorite.mass
                )
                
                MeteoriteInfoItemView(
                    image: "clock",
                    title: "Landed",
                    value: viewModel.meteorite.date
                )
            }
            .padding()
        }
        .onScrollGeometryChange(for: Double.self) { geometry in
            geometry.contentOffset.y
        } action: { _, newValue in
            scrollViewOffsetY = newValue
        }
        .background(Color.background)
        .ignoresSafeArea(edges: .top)
        .customBackButton()
        .navigationTitle(viewModel.meteorite.name)
    }
    
    private var imageView: some View {
        Color.clear
            .frame(maxWidth: .infinity)
            .onGeometryChange(for: Double.self) { geometry in
                geometry.size.width
            } action: {
                imageWidth = $0
            }
            .frame(height: imageWidth * 0.6)
            .overlay(alignment: .bottom) {
                KFImage
                    .url(URL(string: viewModel.meteorite.imageUrl))
                    .placeholder {
                        Color.gray.opacity(0.2)
                            .overlay(Image(systemName: "questionmark.circle"))
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: imageWidth * 0.6 + (scrollViewOffsetY <= 0.0 ? -scrollViewOffsetY : 0.0))
            }
    }
}

#Preview {
    MeteoriteDetail(
        viewModel: MeteoriteDetailViewModel.mocked
    )
}

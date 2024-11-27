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
        ScrollView {
            imageView
            
            Text(viewModel.meteorite.name)
                .font(.title)
                .bold()
                .padding(.vertical)
            
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
            .padding(.horizontal)
        }
        .onScrollGeometryChange(for: Double.self) { geometry in
            geometry.contentOffset.y
        } action: { _, newValue in
            scrollViewOffsetY = newValue
        }
        .background(Color.background)
        .ignoresSafeArea(edges: .top)
        .customBackButton()
        .toolbarColorScheme(.dark, for: .navigationBar)
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
                    .clipShape(.rect)
            }
    }
}

#Preview {
    MeteoriteDetail(
        viewModel: MeteoriteDetailViewModel.mocked
    )
}

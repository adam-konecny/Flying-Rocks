//
//  MeteoriteDetail.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import Kingfisher
import SwiftUI

struct MeteoriteDetail: View {
    @State var viewModel: MeteoriteDetailViewModelProtocol
    
    var body: some View {
        ScrollView {
            VStack {
                imageView
                
                Label {
                    Text(viewModel.meteorite.readableCoordinates)
                } icon: {
                    Image(systemName: "mappin.and.ellipse")
                }
                .font(.body)
                .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle(viewModel.meteorite.name)
        .toolbar(.hidden, for: .tabBar)
    }
    
    private var imageView: some View {
        KFImage
            .url(URL(string: viewModel.meteorite.imageUrl))
            .placeholder {
                Color.gray.opacity(0.2)
                    .overlay(Image(systemName: "questionmark.circle"))
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 160.0)
            .clipShape(.rect(cornerRadius: 16.0))
    }
}

#Preview {
    MeteoriteDetail(
        viewModel: MeteoriteDetailViewModel.mocked
    )
}

//
//  MeteoriteDetail.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import Kingfisher
import SwiftUI

struct MeteoriteDetail: View {
    @State var viewModel: MeteoriteDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
//                imageView
            }
            .padding()
        }
        .navigationTitle(viewModel.meteorite.name)
        .toolbar(.hidden, for: .tabBar)
    }
    
//    private var imageView: some View {
//        KFImage
//            .url(URL(string: viewModel.meteorite.image)!)
//            .placeholder {
//                Color.gray.opacity(0.2)
//                    .overlay(Image(systemName: "person"))
//            }
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 160.0)
//            .clipShape(.rect(cornerRadius: 16.0))
//    }
}

#Preview {
    MeteoriteDetail(
        viewModel: MeteoriteDetailViewModel(
            services: MockedServices(),
            meteorite: MeteoriteFormatter(meteorite: .random)!
        )
    )
}

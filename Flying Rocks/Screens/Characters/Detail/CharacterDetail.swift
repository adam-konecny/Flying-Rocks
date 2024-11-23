//
//  CharacterDetail.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import Kingfisher
import SwiftUI

struct CharacterDetail: View {
    @State var viewModel: CharacterDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                imageView
            }
            .padding()
        }
        .navigationTitle(viewModel.character.nickname)
        .toolbar(.hidden, for: .tabBar)
    }
    
    private var imageView: some View {
        KFImage
            .url(URL(string: viewModel.character.image)!)
            .placeholder {
                Color.gray.opacity(0.2)
                    .overlay(Image(systemName: "person"))
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 160.0)
            .clipShape(.rect(cornerRadius: 16.0))
    }
}

#Preview {
    CharacterDetail(
        viewModel: CharacterDetailViewModel(
            services: MockedServices(),
            character: .random
        )
    )
}

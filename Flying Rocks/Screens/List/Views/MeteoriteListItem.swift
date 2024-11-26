//
//  MeteoriteListItem.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import Kingfisher
import SwiftUI

struct MeteoriteListItem: View {
    private let imageSize = CGSize(width: 128.0, height: 96.0)
    private var imageResolution: CGSize {
        .init(
            width: imageSize.width * UIScreen.main.scale,
            height: imageSize.height * UIScreen.main.scale
        )
    }
    
    let meteorite: MeteoriteDecorator
    
    var body: some View {
        HStack {
            imageView
            
            infoView
            
            Spacer()
        }
        .padding()
        .background {
            MeshGradient(width: 2, height: 2, points: [
                [0, 0], [1, 0],
                [0, 1], [1, 1]
            ], colors: [
                .listBackground, .listBackground,
                .listBackground, .listBackgroundSecondary
            ])
            .clipShape(.rect(cornerRadius: 16.0))
            .shadow(color: Color.black.opacity(0.2), radius: 1.5)
        }
    }
    
    private var imageView: some View {
        KFImage
            .url(URL(string: meteorite.imageUrl))
            .cacheOriginalImage()
            .setProcessor(DownsamplingImageProcessor(size: imageResolution))
            .placeholder {
                Color.gray.opacity(0.2)
                    .overlay(Image(systemName: "questionmark.circle"))
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: imageSize.width, height: imageSize.height)
            .clipShape(.rect(cornerRadius: 12.0))
    }
    
    private var infoView: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(meteorite.name)
                .font(.title2)
                .foregroundColor(.primary)
            
            VStack(alignment: .leading) {
                Label {
                    Text(meteorite.mass)
                } icon: {
                    Image(systemName: "scalemass")
                }
                .font(.body)
                .foregroundColor(.secondary)
                
                Label {
                    Text(meteorite.date)
                } icon: {
                    Image(systemName: "clock")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
        }
    }
}

#Preview("Light") {
    VStack {
        MeteoriteListItem(
            meteorite: MeteoriteDecorator(meteorite: .mocked)!
        )
    }
    .padding()
}

#Preview("Dark") {
    VStack {
        MeteoriteListItem(
            meteorite: MeteoriteDecorator(meteorite: .mocked)!
        )
    }
    .padding()
    .environment(\.colorScheme, .dark)
}

//
//  MeteoriteListItem.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import Kingfisher
import SwiftUI

struct MeteoriteListItem: View {
    let meteorite: MeteoriteDecorator
    
    var body: some View {
        HStack {
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
//                .fill(Color(.listBackground))
                .shadow(color: Color.black.opacity(0.2), radius: 1.5)
        }
    }
    
    private var infoView: some View {
        VStack(alignment: .leading) {
            Text(meteorite.name)
                .font(.title2)
                .foregroundColor(.primary)
            
            Label {
                Text(meteorite.readableCoordinates)
            } icon: {
                Image(systemName: "mappin.and.ellipse")
            }
            .font(.body)
            .foregroundColor(.secondary)
            
            HStack {
                Label {
                    Text(meteorite.mass)
                } icon: {
                    Image(systemName: "scalemass")
                }
                .font(.body)
                .foregroundColor(.secondary)
                
                Spacer()
                
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

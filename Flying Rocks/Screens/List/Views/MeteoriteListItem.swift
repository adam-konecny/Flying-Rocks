//
//  MeteoriteListItem.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 23.11.2024.
//

import Kingfisher
import SwiftUI

struct MeteoriteListItem: View {
    let meteorite: Meteorite
    
    var body: some View {
        HStack {
            imageView
            
            infoView
            
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 4.0)
        }
    }
    
    private var imageView: some View {
        KFImage
            .url(URL(string: meteorite.image)!)
            .placeholder {
                Color.gray.opacity(0.2)
                    .overlay(Image(systemName: "person"))
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 80.0)
            .clipShape(.rect(cornerRadius: 8.0))
    }
    
    private var infoView: some View {
        VStack(alignment: .leading) {
            Text(meteorite.fullName)
                .font(.title3)
                .foregroundColor(.primary)
            
            Text("\"" + meteorite.nickname + "\"")
                .font(.body)
                .foregroundColor(.secondary)
            
            Text(meteorite.interpretedBy)
                .font(.body)
                .foregroundColor(.secondary)
            
            Text(meteorite.birthdate.string(with: .dayMonthYear))
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    VStack {
        MeteoriteListItem(
            meteorite: .random
        )
    }
    .padding()
}

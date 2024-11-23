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
//            imageView
            
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
    
//    private var imageView: some View {
//        KFImage
//            .url(URL(string: meteorite.image)!)
//            .placeholder {
//                Color.gray.opacity(0.2)
//                    .overlay(Image(systemName: "person"))
//            }
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 80.0)
//            .clipShape(.rect(cornerRadius: 8.0))
//    }
    
    private var infoView: some View {
        VStack(alignment: .leading) {
            Text(meteorite.name)
                .font(.title3)
                .foregroundColor(.primary)
            
            if let location = meteorite.location {
                Text("\(location.latitude) x \(location.longitude)")
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            
            Text(String(meteorite.mass ?? 0))
                .font(.body)
                .foregroundColor(.secondary)
            
            Text(meteorite.date?.string(with: .dayMonthYear) ?? "TODO")
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

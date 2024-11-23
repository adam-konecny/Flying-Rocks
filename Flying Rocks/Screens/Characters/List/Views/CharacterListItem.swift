//
//  CharacterListItem.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import Kingfisher
import SwiftUI

struct CharacterListItem: View {
    let character: Person
    
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
            .url(URL(string: character.image)!)
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
            Text(character.fullName)
                .font(.title3)
                .foregroundColor(.primary)
            
            Text("\"" + character.nickname + "\"")
                .font(.body)
                .foregroundColor(.secondary)
            
            Text(character.interpretedBy)
                .font(.body)
                .foregroundColor(.secondary)
            
            Text(character.birthdate.string(with: .dayMonthYear))
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    VStack {
        CharacterListItem(
            character: .random
        )
    }
    .padding()
}

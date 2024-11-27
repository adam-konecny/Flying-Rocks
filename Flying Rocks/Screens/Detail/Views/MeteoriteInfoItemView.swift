//
//  MeteoriteInfoItemView.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 27.11.2024.
//

import SwiftUI

struct MeteoriteInfoItemView: View {
    let image: String
    let title: LocalizedStringResource
    let value: String
    
    init(image: String, title: LocalizedStringResource, value: String) {
        self.image = image
        self.title = title
        self.value = value
    }
    
    init(image: String, title: LocalizedStringResource, value: LocalizedStringResource) {
        self.image = image
        self.title = title
        self.value = String(localized: value)
    }
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.body)
                .bold()
            
            Text(title)
                .font(.body)
                .bold()
                .foregroundStyle(.primary)
            
            Spacer()
            
            Text(value)
                .font(.body)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    VStack {
        MeteoriteInfoItemView(
            image: "mappin.and.ellipse",
            title: "Location",
            value: "ABD"
        )
    }
    .padding()
}

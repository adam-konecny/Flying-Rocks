//
//  SpellListItem.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 07.11.2024.
//

import SwiftUI

struct SpellListItem: View {
    let spell: Spell
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(spell.name)
                    .font(.title3)
                    .foregroundStyle(.primary)
                
                Text(spell.use)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
    }
}

#Preview {
    VStack {
        SpellListItem(
            spell: .random
        )
    }
    .padding()
}

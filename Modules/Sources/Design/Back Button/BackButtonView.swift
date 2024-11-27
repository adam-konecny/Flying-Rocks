//
//  BackButtonView.swift
//  Modules
//
//  Created by Adam Konečný on 27.11.2024.
//

import SwiftUI

struct BackButtonView: View {
    let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.left")
            .padding(8.0)
            .background(Color.black.opacity(0.5))
            .foregroundColor(Color.white)
            .clipShape(.circle)
        }
        .buttonStyle(.plain)
    }
}

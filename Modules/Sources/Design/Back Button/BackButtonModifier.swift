//
//  BackButtonModifier.swift
//  Flying Rocks
//
//  Created by Adam Konečný on 27.11.2024.
//

import SwiftUI

public typealias CustomBackButtonAction = (() -> Bool)

private struct CustomBackButtonActionModifier: ViewModifier {
    @SwiftUI.Environment(\.dismiss) private var dismiss
    
    @Binding var isPresented: Bool
    
    let customAction: CustomBackButtonAction?
    
    func body(content: Self.Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButtonView {
                        if customAction?() ?? true {
                            dismiss()
                        }
                    }
                }
            }
            .onChange(of: isPresented) { _, value in
                if !value {
                    dismiss()
                }
            }
    }
}

public extension View {
    func customBackButton(isPresented: Binding<Bool> = .constant(true), _ action: CustomBackButtonAction? = nil) -> some View {
        self.modifier(CustomBackButtonActionModifier(isPresented: isPresented, customAction: action))
    }
}

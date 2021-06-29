//
//  KeyboardAdaptiveModifier.swift
//  
//
//  Created by 杉山優悟 on 2021/02/09.
//

import SwiftUI
import Combine

// Ref: https://www.vadimbulavin.com/how-to-move-swiftui-view-when-keyboard-covers-text-field/
struct KeyboardAdaptiveModifier: ViewModifier {
    @State private var bottomPadding: CGFloat = 0

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, self.bottomPadding)
                .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    let keyboardTop = geometry.frame(in: .global).height - keyboardHeight
                    let focusedTextInputBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    self.bottomPadding = max(0, focusedTextInputBottom - keyboardTop - geometry.safeAreaInsets.bottom)
            }
            .background(Color.blue)
            .animation(.easeOut(duration: 0.16))
        }
    }
}

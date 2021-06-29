//
//  TapHighlightableModifier.swift
//  
//
//  Created by Yugo Sugiyama on 2021/01/11.
//

import SwiftUI

public struct TapHighlightableModifier: ViewModifier {
    @State private var isPressed = false

    public func body(content: Content) -> some View {
        return content
            .onLongPressGesture(minimumDuration: 0.2) { isPressed in
                        self.isPressed = isPressed
                    } perform: {}
            .overlay(isPressed ? Color(.systemBackground).opacity(0.4).mask(content) : Color.clear.mask(content))
            .animation(.easeInOut(duration: 0.1))
    }
}


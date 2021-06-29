//
//  ScaleBounceModifier.swift
//  
//
//  Created by Yugo Sugiyama on 2021/01/11.
//

import SwiftUI

public struct ScaleBounceModifier: ViewModifier {
    @State private var isPressed = false

    public func body(content: Content) -> some View {
        return content
            .onLongPressGesture(minimumDuration: 0.2) { isPressed in
                        self.isPressed = isPressed
                    } perform: {}
            .scaleEffect(isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.1))
    }
}

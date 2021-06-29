// 
// Created on 2020/02/22
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import SwiftUI

public enum ColorMode {
    case light
    case dark
}

public struct ColorScheme: ViewModifier {
    private let color: ColorMode

    public init(color: ColorMode) {
        self.color = color
    }

    public func body(content: Content) -> some View {
        switch color {
        case .light:
            return content
                .environment(\.colorScheme, .light)
        case .dark:
            return content
                .environment(\.colorScheme, .dark)
        }

    }
}

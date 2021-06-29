// 
// Created on 2020/02/22
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import SwiftUI

public struct Hidden: ViewModifier {
    let hidden: Bool

    public init(hidden: Bool) {
        self.hidden = hidden
    }

    public func body(content: Content) -> some View {
        VStack {
            if !hidden {
                content
            }
        }
    }
}

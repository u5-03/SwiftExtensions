// 
// Created on 2020/02/22
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import SwiftUI
import Combine

public extension Binding where Value == Bool {
    func toggle() -> Binding<Bool> {
        Binding<Bool>(get: { () -> Bool in
            !self.wrappedValue
        }, set: { value in
            self.wrappedValue = value
        })
    }
}

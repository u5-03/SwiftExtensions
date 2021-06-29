//
//  TextField.swift
//  
//
//  Created by Yugo Sugiyama on 2021/01/13.
//

import SwiftUI

public extension TextField {
    func clearButton(text: Binding<String>) -> some View {
        ModifiedContent(content: self, modifier: ClearButtonModifier(text: text))
    }
}

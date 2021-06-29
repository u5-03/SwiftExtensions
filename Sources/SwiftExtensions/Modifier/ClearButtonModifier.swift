//
//  ClearButtonModifier.swift
//  
//
//  Created by Yugo Sugiyama on 2021/01/13.
//

import SwiftUI

public struct ClearButtonModifier: ViewModifier {
    @Binding var text: String

    public func body(content: Content) -> some View {
        HStack(alignment: .center, spacing: 8) {
            content
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "minus.circle")
                        .resizable()
                        .foregroundColor(Color(.systemGray3))
                        .frame(width: 16, height: 16)
                }
                .padding(.trailing, 8)
            }
        }
    }
}

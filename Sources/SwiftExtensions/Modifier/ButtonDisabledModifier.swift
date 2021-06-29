//
//  ButtonDisabledModifier.swift
//  
//
//  Created by 杉山優悟 on 2021/02/06.
//

import SwiftUI

public struct ButtonDisabledModifier: ViewModifier {
    private let isDisabled: Bool

    public init(isDisabled: Bool) {
        self.isDisabled = isDisabled
    }

    public func body(content: Content) -> some View {
        return content
            .overlay(isDisabled ? Color(.systemBackground).opacity(0.6).mask(content) : Color.clear.mask(content))
            .disabled(isDisabled)
    }
}

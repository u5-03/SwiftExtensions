// 
// Created on 2020/06/07
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import Foundation

extension NSAttributedString {
    convenience init(@AttributedStringBuilder _ content: () -> NSAttributedString) {
      self.init(attributedString: content())
    }
}

@_functionBuilder
public struct AttributedStringBuilder {
    public init() {}

    public static func buildBlock(_ segments: NSAttributedString...) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        segments.forEach({
            attributedString.append($0)
        })
        return attributedString
    }
}

//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import UIKit

public extension UITextView {

    var caretPosition: Int? {
        let startPosition = self.beginningOfDocument
        guard let selectedPosition = self.selectedTextRange?.start else { return nil }
        return self.offset(from: startPosition, to: selectedPosition)
    }

    var numberOfLines: Int {
        // prepare
        var computingLineIndex = 0
        var computingGlyphIndex = 0
        // compute
        while computingGlyphIndex < layoutManager.numberOfGlyphs {
            var lineRange = NSRange()
            layoutManager.lineFragmentRect(forGlyphAt: computingGlyphIndex, effectiveRange: &lineRange)
            computingGlyphIndex = NSMaxRange(lineRange)
            computingLineIndex += 1
        }
        // return
        if textContainer.maximumNumberOfLines > 0 {
            return min(textContainer.maximumNumberOfLines, computingLineIndex)
        } else {
            return computingLineIndex
        }
    }
}

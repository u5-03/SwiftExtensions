//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import UIKit

public extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }

    var keyboardFrame: CGRect? {
        guard let userInfo = self.userInfo,
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else {
                return nil
        }
        return keyboardFrame
    }

    var keyBoardExpandDuration: TimeInterval? {
        guard let userInfo = self.userInfo,
            let keyBoardExpandDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return nil }
        return keyBoardExpandDuration
    }
}

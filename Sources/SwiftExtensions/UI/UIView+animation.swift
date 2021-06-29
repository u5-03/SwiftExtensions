//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import UIKit

extension UIView {
    public static func execute(isAnimated: Bool, withDuration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        if isAnimated {
            UIView.animate(withDuration: withDuration, animations: animations, completion: completion)
        } else {
            animations()
            completion?(true)
        }
    }

    public static func transition(with view: UIView, duration: TimeInterval, options: UIView.AnimationOptions, animated: Bool, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        if animated {
            UIView.transition(with: view, duration: duration, options: options, animations: animations, completion: completion)
        } else {
            animations()
            completion?(true)
        }
    }

    public func fadeAnimation(isHidden: Bool, duration: TimeInterval = 0, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: { [weak self] in
            self?.alpha = isHidden ? 0 : 1
            self?.layoutIfNeeded()
        }, completion: { isComplete in
            completion?(isComplete)
        })
    }
}

//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import UIKit
import StoreKit

public extension UIView {
    var className: String {
        String(describing: type(of: self))
    }

    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            parentResponder = nextResponder
        }
    }
}

//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import UIKit

public extension UIViewController {
    var className: String {
        String(describing: type(of: self))
    }
}

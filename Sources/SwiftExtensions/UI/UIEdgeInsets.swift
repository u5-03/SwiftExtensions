// 
// Created on 2020/06/20
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    static let zero = UIEdgeInsets()

    static func all(length: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: length, left: length, bottom: length, right: length)
    }
}

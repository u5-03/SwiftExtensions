//
//  UIColor.swift
//  
//
//  Created by Yugo Sugiyama on 2020/12/26.
//

import UIKit

public extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1)
    }

    static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }

    var red: CGFloat {
        return (cgColor.components?[0] ?? CGFloat(255)) * 255
    }

    var green: CGFloat {
        return (cgColor.components?[1] ?? CGFloat(255)) * 255
    }

    var blue: CGFloat {
        return (cgColor.components?[2] ?? CGFloat(255)) * 255
    }

    var alpha: CGFloat {
        return cgColor.components?[3] ?? CGFloat(1)
    }
}

//
//  Bool.swift
//  
//
//  Created by 杉山優悟 on 2020/12/31.
//

import Foundation

public extension Bool {
    static var random: Bool {
        return Int.random(in: 1...2).isMultiple(of: 2)
    }

    var toggled: Bool {
        return !self
    }
}

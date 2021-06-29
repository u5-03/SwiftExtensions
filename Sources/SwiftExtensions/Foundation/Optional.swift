// 
// Created on 2019/11/02
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import Foundation

public extension Optional {
    func unwrapped<T>(_ defaultValue: T) -> T {
        switch self {
        case .none:
            return defaultValue
        case .some(let value):
            return (value as? T) ?? defaultValue
        }
    }
}

public extension Optional where Wrapped == String {
    var nilOrEmptyValidated: String? {
        switch self {
        case .none:
            return nil
        case .some(let value):
            return value.isEmpty ? nil : value
        }
    }
}

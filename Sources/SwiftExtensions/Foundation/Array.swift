// 
// Created on 2020/05/06
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import Foundation

public enum SortOrder {
    case ascending
    case descending
}

public extension Sequence {
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, order: SortOrder = .ascending,
                               by secondKeyPath: KeyPath<Element, T>? = nil, secondOrder: SortOrder = .ascending) -> [Element] {
        return sorted { (lhs, rhs) -> Bool in
            switch order {
            case .ascending:
                return lhs[keyPath: keyPath] < rhs[keyPath: keyPath]
            case .descending:
                return lhs[keyPath: keyPath] > rhs[keyPath: keyPath]
            }
        }
    }
}

//
//  Publisher.swift
//
//  Created by 杉山優悟 on 2020/09/28.
//

import Foundation
import Combine

// Ref: https://github.com/CombineCommunity/CombineExt/blob/master/Sources/Operators/CombineLatestMany.swift
public extension Publisher {
    func combineLatest<Others: Collection>(_ collection: Others) -> AnyPublisher<[Output], Failure> where Others.Element: Publisher, Others.Element.Output == Output, Others.Element.Failure == Failure {
        let basePublisher = map({ [$0] }).eraseToAnyPublisher()
        return collection.reduce(basePublisher) { (total, next) in
            total.combineLatest(next)
                .map({ $0 + [$1] })
                .eraseToAnyPublisher()
        }
    }

    func combineLatest<Other: Publisher>(_ collection: Other...) -> AnyPublisher<[Output], Failure> where Other.Output == Output, Other.Failure == Failure {
        combineLatest(collection)
    }

    // https://twitter.com/marty_suzuki/status/1231141838028857346/photo/1
    func flatMapLatest<T: Publisher>(_ transform: @escaping (Output) -> T) -> Publishers.SwitchToLatest<T, Publishers.Map<Self, T>> where T.Failure == Failure {
        map(transform).switchToLatest()
    }
}

public extension Collection where Element: Publisher {
    func combineLatest() -> AnyPublisher<[Element.Output], Element.Failure> {
        switch count {
        case 0:
            return Empty().eraseToAnyPublisher()
        case 1:
            return self[startIndex].combineLatest([Element]())
        default:
            return self[startIndex].combineLatest(self[index(after: startIndex)...])
        }
    }
}

public extension Publisher where Output == Bool, Failure == Never {
    var toggled: AnyPublisher<Bool, Never> {
        return self.map({ !$0 }).eraseToAnyPublisher()
    }
}

//
//  Publishers.swift
//  
//
//  Created by 杉山優悟 on 2021/02/09.
//

import UIKit
import Combine

public extension Publishers {
    // 1.
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        // 2.
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }

        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }

        // 3.
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

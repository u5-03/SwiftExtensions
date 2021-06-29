//
//  UIVIew+SwiftUI.swift
//  
//
//  Created by Yugo Sugiyama on 2020/12/26.
//

import UIKit
import SwiftUI

public extension UIView {
    func addView<T: View>(view: T) {
        let vc = UIHostingController(rootView: view)
        parentViewController?.addChild(vc)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(vc.view)
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: topAnchor),
            vc.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: vc.view.trailingAnchor),
            bottomAnchor.constraint(equalTo: vc.view.bottomAnchor)
        ])
        vc.view.backgroundColor = .clear
        vc.didMove(toParent: parentViewController)
    }

    func addView<T: View>(@ViewBuilder content: () -> T) {
        addView(view: content())
    }
}

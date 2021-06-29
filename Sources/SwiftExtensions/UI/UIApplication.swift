//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import UIKit

public extension UIApplication {

    var isUnitTesting: Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }

    var windowScene: UIWindowScene? {
        return connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
    }

    var keyWindow: UIWindow? {
        return windowScene?.windows
            .first(where: { $0.isKeyWindow })
    }

    var statusBarHeight: CGFloat {
        return windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }

    static var topViewController: UIViewController? {
        let vc = UIApplication.shared.keyWindow?.rootViewController
        return topViewController(viewController: vc)
    }

    private static func topViewController(viewController: UIViewController?) -> UIViewController? {
        if let tabController = viewController as? UITabBarController,
           let selected = tabController.selectedViewController {
            return topViewController(viewController: selected)
        }
        if let navigationController = viewController as? UINavigationController {
            return topViewController(viewController: navigationController.visibleViewController)
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }
        return viewController
    }

    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

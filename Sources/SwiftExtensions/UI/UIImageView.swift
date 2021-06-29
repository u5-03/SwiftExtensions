//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import UIKit

public extension UIImageView {

    private static let duration = 0.5
    func setImage(image: UIImage?, animated: Bool = true) {
        DispatchQueue.main.async {
            if animated {
                UIView.transition(with: self, duration: UIImageView.duration, options: .transitionCrossDissolve, animations: {
                    self.image = image
                }, completion: nil)
            } else {
                self.image = image
            }
        }
    }
}

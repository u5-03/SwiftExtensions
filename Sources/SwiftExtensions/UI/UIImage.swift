//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//
import UIKit

public enum sfSymbol: String, CaseIterable {
    case xmark
    case plus
    case trash
    case personFill = "person.fill"
    case copy = "doc.on.doc"
    case gear
    case briefcase
    case cube
    case pencil
    case bag
}

public extension UIImage {
    static func fetchImage(by url: URL) -> UIImage? {
        do {
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }

    static func sfSymbol(name: sfSymbol, pointSize: CGFloat = 17, weight: UIImage.SymbolWeight = .regular, scale: UIImage.SymbolScale = .default) -> UIImage? {
        UIImage(systemName: name.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: pointSize, weight: weight, scale: scale))
    }

    func saveImage(completion: (() -> Void)? = nil) {
        UIImageWriteToSavedPhotosAlbum(self, self, #selector(didCompleteSaveImage), nil)
    }

    @objc private func didCompleteSaveImage(completion: (() -> Void)? = nil) {
        completion?()
    }
}

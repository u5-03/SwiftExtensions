//
//  UICollectionViewCell.swift
//  
//
//  Created by Yugo Sugiyama on 2020/12/26.
//

import UIKit

public extension UICollectionViewCell {
    static var cellKey: String {
        return String(describing: self)
    }
}

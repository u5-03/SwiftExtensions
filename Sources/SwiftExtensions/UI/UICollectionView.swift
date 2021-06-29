//
//  UICollectionView.swift
//  
//
//  Created by Yugo Sugiyama on 2020/12/26.
//

import UIKit

public extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let key = T.cellKey
        return dequeueReusableCell(withReuseIdentifier: key, for: indexPath) as! T
    }

    func register(_ cellClass: UICollectionViewCell.Type) {
        register(cellClass.self, forCellWithReuseIdentifier: cellClass.cellKey)
    }
}

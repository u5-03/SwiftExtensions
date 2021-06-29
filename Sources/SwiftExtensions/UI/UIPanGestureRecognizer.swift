//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import UIKit

public enum PanGestureDirection: String {
    case up = "Up"
    case down = "Down"
    case right = "Right"
    case left = "Left"
}

extension UIPanGestureRecognizer {

//    struct PanGestureDirection: OptionSet {
//        public let rawValue: Int
//
//        public init(rawValue: Int) {
//            self.rawValue = rawValue
//        }
//
//        static let Up = PanGestureDirection(rawValue: 1 << 0)
//        static let Down = PanGestureDirection(rawValue: 1 << 1)
//        static let Left = PanGestureDirection(rawValue: 1 << 2)
//        static let Right = PanGestureDirection(rawValue: 1 << 3)
//    }
//
//    private func getDirectionBy(velocity: CGFloat, greater: PanGestureDirection, lower: PanGestureDirection) -> PanGestureDirection {
//        if velocity == 0 {
//            return []
//        }
//        return velocity > 0 ? greater : lower
//    }
//
//    func direction(in view: UIView) -> PanGestureDirection {
//        let velocity = self.velocity(in: view)
//        let yDirection = getDirectionBy(velocity: velocity.y, greater: PanGestureDirection.Down, lower: PanGestureDirection.Up)
//        let xDirection = getDirectionBy(velocity: velocity.x, greater: PanGestureDirection.Right, lower: PanGestureDirection.Left)
//        return xDirection.union(yDirection)
//        print(xDirection)
//        print(yDirection)
//        return yDirection.union(xDirection)
//    }

//    extension PanGestureDirection: Equatable {
//        static func == (lhs: PanGestureDirection, rhs: PanGestureDirection) -> Bool {
//            return lhs
//        }
//    }

    public func getDirection(upDownEmphasized: Bool = false) -> PanGestureDirection {
        // タップ開始地点からの移動量を取得
        let position = translation(in: view)
        let tapEndPosX = position.x     // x方向の移動量(左右の判定を厳し目にする)
        let tapEndPosY = -position.y    // y方向の移動量（上をプラスと扱うため、符号反転する）
        // 上下左右のフリック方向を判別する
        // xがプラスの場合（右方向）とマイナスの場合（左方向）で場合分け
        if tapEndPosX > 0 {
            // 右方向へのフリック
            if tapEndPosY * 1.0 > tapEndPosX {
                // yの移動量がxより大きい→上方向
                return .up
            } else if tapEndPosY < -tapEndPosX * 1.0 {
                // yの移動量が-xより小さい→下方向
                return .down
            } else {
                // 右方向
                return .right
            }
        } else {
            // 左方向へのフリック
            if tapEndPosY * 1.0 > -tapEndPosX {
                // yの移動量が-xより大きい→上方向
                return .up
            } else if tapEndPosY < tapEndPosX * 1.0 {
                // yの移動量がxより小さい→下方向
                return .down
            } else {
                // 左方向
                return .left
            }
        }
    }
}

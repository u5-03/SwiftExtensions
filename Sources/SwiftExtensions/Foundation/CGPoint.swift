//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import UIKit

public extension CGPoint {
    func getDirection(to point: CGPoint) -> PanGestureDirection {
        // タップ開始地点からの移動量を取得
        let tapEndPosX = point.x - x   // x方向の移動量(左右の判定を厳し目にする)
        let tapEndPosY = -(point.y - y)    // y方向の移動量（上をプラスと扱うため、符号反転する）
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

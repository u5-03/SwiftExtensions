//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

//import UIKit
//import Photos
//
//enum ContentType {
//    case image(UIImage)
//    case asset(PHAsset)
//}
//
//enum ContentMediaType {
//    case image(PHAsset)
//    case livePhoto(PHAsset)
//    case video(PHAsset)
//}
//
//extension ContentMediaType: Equatable {
//    static func == (lhs: ContentMediaType, rhs: ContentMediaType) -> Bool {
//        switch (lhs, rhs) {
//        case let (.image(lhsAsset), .image(rhsAsset)): return lhsAsset == rhsAsset
//        case let (.livePhoto(lhsAsset), .livePhoto(rhsAsset)): return lhsAsset == rhsAsset
//        case let (.video(lhsAsset), .video(rhsAsset)): return lhsAsset == rhsAsset
//        default: return false
//        }
//    }
//}

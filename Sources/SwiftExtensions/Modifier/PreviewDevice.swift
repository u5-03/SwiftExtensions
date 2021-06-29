// 
// Created on 2020/02/21
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import SwiftUI

// swiftlint:disable identifier_name
public enum Device: String {
    // iPhone
    case iPhoneSE = "iPhone SE"
    case iPhone7 = "iPhone 7"
    case iPhone7Plus = "iPhone 7 Plus"
    case iPhone8 = "iPhone 8"
    case iPhone8Plus = "iPhone 8 Plus"
    case iPhoneX = "iPhone X"
    case iPhoneXs = "iPhone Xs"
    case iPhoneXsMax = "iPhone Xs Max"
    case iPhoneXR = "iPhone XR"
    case iPhone11 = "iPhone 11"
    case iPhone11Pro = "iPhone 11 Pro"
    case iPhone11ProMax = "iPhone 11 Pro Max"
    // iPad
    case iPadMini4 = "iPad mini 4"
    case iPadAir2 = "iPad Air 2"
    case iPadPro9_7inch = "iPad Pro (9.7-inch)"
    case iPadPro12_9inch = "iPad Pro (12.9-inch)"
    case iPad5th = "iPad (5th generation)"
    case iPadPro12_9inch2nd = "iPad Pro (12.9-inch) (2nd generation)"
    case iPadPro10_5inch = "iPad Pro (10.5-inch)"
    case iPad6th = "iPad (6th generation)"
    case iPadPro11inch = "iPad Pro (11-inch)"
    case iPadPro12_9inch3rd = "iPad Pro (12.9-inch) (3rd generation)"
    case iPadMini5th = "iPad mini (5th generation)"
    case iPadAir3rd = "iPad Air (3rd generation)"
    // AppleTV
    case AppleTV = "Apple TV"
    case AppleTV4K = "Apple TV 4K"
    case AppleTV4K_1080p = "Apple TV 4K (at 1080p)"
    // AppleWatch
    case AppleWatchS2_38mm = "Apple Watch Series 2 - 38mm"
    case AppleWatchS2_42mm = "Apple Watch Series 2 - 42mm"
    case AppleWatchS3_38mm = "Apple Watch Series 3 - 38mm"
    case AppleWatchS3_42mm = "Apple Watch Series 3 - 42mm"
    case AppleWatchS4_40mm = "Apple Watch Series 4 - 40mm"
    case AppleWatchS4_44mm = "Apple Watch Series 4 - 44mm"
    case AppleWatchS5_40mm = "Apple Watch Series 5 - 40mm"
    case AppleWatchS5_44mm = "Apple Watch Series 5 - 44mm"
}

public struct DisplayPreviewDevice: ViewModifier {
    let device: Device

    public init(device: Device) {
        self.device = device
    }

    public func body(content: Content) -> some View {
        content
            .previewDevice(PreviewDevice(rawValue: device.rawValue))
    }
}

struct DisplayPreviewDevices: ViewModifier {
    let devices: [Device]

    public init(devices: [Device]) {
        self.devices = devices
    }

    public func body(content: Content) -> some View {
        ForEach(devices, id: \.self) { device in
            content
                .previewDevice(PreviewDevice(rawValue: device.rawValue))
        }
    }
}

public struct PreviewDisplayDeviceName: ViewModifier {
    let device: Device

    public init(device: Device) {
        self.device = device
    }

    public func body(content: Content) -> some View {
        content
            .previewDisplayName(device.rawValue)
    }
}

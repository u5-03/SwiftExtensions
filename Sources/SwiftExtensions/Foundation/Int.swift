//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import UIKit

public extension Int {
    static var random: Int {
        let length = Int.random(in: 0...10)
        var randomString = ""

        for _ in 0...length {
            let randomValue = Int.random(in: 0 ... 9)
            randomString += String(randomValue)
        }
        return Int(randomString) ?? 0
    }
    
    var withComma: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let commaString = formatter.string(from: self as NSNumber)
        return commaString ?? "\(self)"
    }

    var asString: String {
        String(self)
    }

    var asDouble: Double {
        Double(self)
    }

    func intToDate() -> Date {
        let timeInterval = TimeInterval(self)
        return Date(timeIntervalSince1970: timeInterval)
    }

    func intToDateString(format: DateToStringFormat = .monthDayWithTime) -> String {
        Date(timeIntervalSince1970: TimeInterval(self)).asString(withFormat: format)
    }
}

// 
// Created on 2020/05/06
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import Foundation

public extension Date {
    var earlierThanToday: Bool {
        let today = Calendar(identifier: .gregorian).startOfDay(for: Date()).timeIntervalSince1970
        return self.timeIntervalSince1970 < today
    }

    func isSameDay(with date: Date) -> Bool {
        let diff = Calendar.current.dateComponents([.day], from: self, to: date)
        return diff.day == 0
    }

    func diffDays(with date: Date) -> Int {
        return Calendar(identifier: .gregorian).dateComponents([.year, .month, .day], from: self, to: date).day ?? 0
    }

    func offsetYears(offset: Int) -> Date? {
        return Calendar.current.date(byAdding: .year, value: offset, to: self)
    }

    func offsetMonths(offset: Int) -> Date? {
        return Calendar.current.date(byAdding: .month, value: offset, to: self)
    }

    func offsetDays(offset: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: offset, to: self)
    }

    var yesterday: Date? {
        return offsetDays(offset: -1)
    }
    var tomorrow: Date? {
        return offsetDays(offset: 1)
    }

    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }

    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }

    var weekIndex: Int {
        let calendar = Calendar(identifier: .gregorian)
        if let weekday = calendar.dateComponents([.weekday], from: self).weekday {
            return weekday
        }
        return -1
    }

    static func random(offset: Int = 0) -> Date {
        let day: Int
        if offset > 0 {
            day = Int.random(in: 0...offset + 1)
        } else {
            day = Int.random(in: offset...0)
        }
        let hour = Int.random(in: 0...23)
        let minute = Int.random(in: 0...59)

        let today = Date(timeIntervalSinceNow: 0)
        let gregorian  = Calendar(identifier: .gregorian)
        var offsetComponents = DateComponents()
        offsetComponents.day = -1 * (day - 1)
        offsetComponents.hour = -1 * hour
        offsetComponents.minute = -1 * minute

        let randomDate = gregorian
            .date(byAdding: offsetComponents, to: today, wrappingComponents: true)
        return randomDate ?? Date()
    }
}

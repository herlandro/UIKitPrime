//
//  Date.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 17/08/2024.
//

import Foundation

public extension Date {

    func isBetween(beginDate: Date, endDate: Date) -> Bool {

        return beginDate.compare(self) == self.compare(endDate)
    }

    func isSameDay(as date2: Date) -> Bool {

        return DateHelper.isInSameTime(date1: self, date2: date2, timeUnity: Calendar.Component.day)
    }

    func isSameMonth(as date2: Date) -> Bool {

        return DateHelper.isInSameTime(date1: self, date2: date2, timeUnity: Calendar.Component.month)
    }

    func isSameYear(as date2: Date) -> Bool {

        return DateHelper.isInSameTime(date1: self, date2: date2, timeUnity: Calendar.Component.year)
    }

    func isInSame(timeUnit: Calendar.Component, as date2: Date) -> Bool {

        return Calendar.current.isDate(self, equalTo: date2, toGranularity: timeUnit)
    }

    var startOfMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }

    var endOfMonth: Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth)!
    }

    var startOfYear: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year], from: Calendar.current.startOfDay(for: self)))!
    }
}

public extension Date {

    /// Day name format.
    ///
    /// - threeLetters: 3 letter day abbreviation of day name.
    /// - oneLetter: 1 letter day abbreviation of day name.
    /// - full: Full day name.
    enum DayNameStyle {

        /// 3 letter day abbreviation of day name.
        case threeLetters

        /// 1 letter day abbreviation of day name.
        case oneLetter

        /// Full day name.
        case full

    }

    /// Month name format.
    ///
    /// - threeLetters: 3 letter month abbreviation of month name.
    /// - oneLetter: 1 letter month abbreviation of month name.
    /// - full: Full month name.
    enum MonthNameStyle {

        /// 3 letter month abbreviation of month name.
        case threeLetters

        /// 1 letter month abbreviation of month name.
        case oneLetter

        /// Full month name.
        case full

    }


    /// User’s current calendar.
    var calendar: Calendar {
        return Calendar(identifier: Calendar.current.identifier) // Workaround to segfault on corelibs foundation https://bugs.swift.org/browse/SR-10147
    }

    /// Era.
    ///
    ///        Date().era -> 1
    ///
    var era: Int {
        return calendar.component(.era, from: self)
    }

    #if !os(Linux)
        /// Quarter.
        ///
        ///        Date().quarter -> 3 // date in third quarter of the year.
        ///
        var quarter: Int {
            let month = Double(calendar.component(.month, from: self))
            let numberOfMonths = Double(calendar.monthSymbols.count)
            let numberOfMonthsInQuarter = numberOfMonths / 4
            return Int(ceil(month / numberOfMonthsInQuarter))
        }
    #endif

    /// Week of year.
    ///
    ///        Date().weekOfYear -> 2 // second week in the year.
    ///
    var weekOfYear: Int {
        return calendar.component(.weekOfYear, from: self)
    }

    /// Week of month.
    ///
    ///        Date().weekOfMonth -> 3 // date is in third week of the month.
    ///
    var weekOfMonth: Int {
        return calendar.component(.weekOfMonth, from: self)
    }

    /// Year.
    ///
    ///        Date().year -> 2017
    ///
    ///        var someDate = Date()
    ///        someDate.year = 2000 // sets someDate's year to 2000
    ///
    var year: Int {
        get {
            return calendar.component(.year, from: self)
        }
        set {
            guard newValue > 0 else { return }
            let currentYear = calendar.component(.year, from: self)
            let yearsToAdd = newValue - currentYear
            if let date = calendar.date(byAdding: .year, value: yearsToAdd, to: self) {
                self = date
            }
        }
    }

    /// Month.
    ///
    ///     Date().month -> 1
    ///
    ///     var someDate = Date()
    ///     someDate.month = 10 // sets someDate's month to 10.
    ///
    var month: Int {
        get {
            return calendar.component(.month, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .month, in: .year, for: self)!
            guard allowedRange.contains(newValue) else { return }

            let currentMonth = calendar.component(.month, from: self)
            let monthsToAdd = newValue - currentMonth
            if let date = calendar.date(byAdding: .month, value: monthsToAdd, to: self) {
                self = date
            }
        }
    }

    /// Day.
    ///
    ///     Date().day -> 12
    ///
    ///     var someDate = Date()
    ///     someDate.day = 1 // sets someDate's day of month to 1.
    ///
    var day: Int {
        get {
            return calendar.component(.day, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .day, in: .month, for: self)!
            guard allowedRange.contains(newValue) else { return }

            let currentDay = calendar.component(.day, from: self)
            let daysToAdd = newValue - currentDay
            if let date = calendar.date(byAdding: .day, value: daysToAdd, to: self) {
                self = date
            }
        }
    }

    /// Weekday.
    ///
    ///     Date().weekday -> 5 // fifth day in the current week.
    ///
    var weekday: Int {
        return calendar.component(.weekday, from: self)
    }

    /// Hour.
    ///
    ///     Date().hour -> 17 // 5 pm
    ///
    ///     var someDate = Date()
    ///     someDate.hour = 13 // sets someDate's hour to 1 pm.
    ///
    var hour: Int {
        get {
            return calendar.component(.hour, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .hour, in: .day, for: self)!
            guard allowedRange.contains(newValue) else { return }

            let currentHour = calendar.component(.hour, from: self)
            let hoursToAdd = newValue - currentHour
            if let date = calendar.date(byAdding: .hour, value: hoursToAdd, to: self) {
                self = date
            }
        }
    }

    /// Minutes.
    ///
    ///     Date().minute -> 39
    ///
    ///     var someDate = Date()
    ///     someDate.minute = 10 // sets someDate's minutes to 10.
    ///
    var minute: Int {
        get {
            return calendar.component(.minute, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .minute, in: .hour, for: self)!
            guard allowedRange.contains(newValue) else { return }

            let currentMinutes = calendar.component(.minute, from: self)
            let minutesToAdd = newValue - currentMinutes
            if let date = calendar.date(byAdding: .minute, value: minutesToAdd, to: self) {
                self = date
            }
        }
    }

    /// Seconds.
    ///
    ///     Date().second -> 55
    ///
    ///     var someDate = Date()
    ///     someDate.second = 15 // sets someDate's seconds to 15.
    ///
    var second: Int {
        get {
            return calendar.component(.second, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .second, in: .minute, for: self)!
            guard allowedRange.contains(newValue) else { return }

            let currentSeconds = calendar.component(.second, from: self)
            let secondsToAdd = newValue - currentSeconds
            if let date = calendar.date(byAdding: .second, value: secondsToAdd, to: self) {
                self = date
            }
        }
    }

    /// Nanoseconds.
    ///
    ///     Date().nanosecond -> 981379985
    ///
    ///     var someDate = Date()
    ///     someDate.nanosecond = 981379985 // sets someDate's seconds to 981379985.
    ///
    var nanosecond: Int {
        get {
            return calendar.component(.nanosecond, from: self)
        }
        set {
            let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(newValue) else { return }

            let currentNanoseconds = calendar.component(.nanosecond, from: self)
            let nanosecondsToAdd = newValue - currentNanoseconds

            if let date = calendar.date(byAdding: .nanosecond, value: nanosecondsToAdd, to: self) {
                self = date
            }
        }
    }

    /// Milliseconds.
    ///
    ///     Date().millisecond -> 68
    ///
    ///     var someDate = Date()
    ///     someDate.millisecond = 68 // sets someDate's nanosecond to 68000000.
    ///
    var millisecond: Int {
        get {
            return calendar.component(.nanosecond, from: self) / 1000000
        }
        set {
            let nanoSeconds = newValue * 1000000
            let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(nanoSeconds) else { return }

            if let date = calendar.date(bySetting: .nanosecond, value: nanoSeconds, of: self) {
                self = date
            }
        }
    }

    /// Check if date is in future.
    ///
    ///     Date(timeInterval: 100, since: Date()).isInFuture -> true
    ///
    var isInFuture: Bool {
        return self > Date()
    }

    /// Check if date is in past.
    ///
    ///     Date(timeInterval: -100, since: Date()).isInPast -> true
    ///
    var isInPast: Bool {
        return self < Date()
    }

    /// Check if date is within today.
    ///
    ///     Date().isInToday -> true
    ///
    var isInToday: Bool {
        return calendar.isDateInToday(self)
    }

    /// Check if date is within yesterday.
    ///
    ///     Date().isInYesterday -> false
    ///
    var isInYesterday: Bool {
        return calendar.isDateInYesterday(self)
    }

    /// Check if date is within tomorrow.
    ///
    ///     Date().isInTomorrow -> false
    ///
    var isInTomorrow: Bool {
        return calendar.isDateInTomorrow(self)
    }

    /// Check if date is within a weekend period.
    var isInWeekend: Bool {
        return calendar.isDateInWeekend(self)
    }

    /// Check if date is within a weekday period.
    var isWorkday: Bool {
        return !calendar.isDateInWeekend(self)
    }

    /// Check if date is within the current week.
    var isInCurrentWeek: Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .weekOfYear)
    }

    /// Check if date is within the current month.
    var isInCurrentMonth: Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .month)
    }

    /// Check if date is within the current year.
    var isInCurrentYear: Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: .year)
    }

    /// ISO8601 string of format (yyyy-MM-dd'T'HH:mm:ss.SSS) from date.
    ///
    ///     Date().iso8601String -> "2017-01-12T14:51:29.574Z"
    ///
    var iso8601String: String {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"

        return dateFormatter.string(from: self).appending("Z")
    }

    /// Nearest five minutes to date.
    ///
    ///     var date = Date() // "5:54 PM"
    ///     date.minute = 32 // "5:32 PM"
    ///     date.nearestFiveMinutes // "5:30 PM"
    ///
    ///     date.minute = 44 // "5:44 PM"
    ///     date.nearestFiveMinutes // "5:45 PM"
    ///
    var nearestFiveMinutes: Date {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
        let min = components.minute!
        components.minute! = min % 5 < 3 ? min - min % 5: min + 5 - (min % 5)
        components.second = 0
        components.nanosecond = 0
        return calendar.date(from: components)!
    }

    /// Nearest ten minutes to date.
    ///
    ///     var date = Date() // "5:57 PM"
    ///     date.minute = 34 // "5:34 PM"
    ///     date.nearestTenMinutes // "5:30 PM"
    ///
    ///     date.minute = 48 // "5:48 PM"
    ///     date.nearestTenMinutes // "5:50 PM"
    ///
    var nearestTenMinutes: Date {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
        let min = components.minute!
        components.minute? = min % 10 < 6 ? min - min % 10: min + 10 - (min % 10)
        components.second = 0
        components.nanosecond = 0
        return calendar.date(from: components)!
    }

    /// Nearest quarter hour to date.
    ///
    ///     var date = Date() // "5:57 PM"
    ///     date.minute = 34 // "5:34 PM"
    ///     date.nearestQuarterHour // "5:30 PM"
    ///
    ///     date.minute = 40 // "5:40 PM"
    ///     date.nearestQuarterHour // "5:45 PM"
    ///
    var nearestQuarterHour: Date {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
        let min = components.minute!
        components.minute! = min % 15 < 8 ? min - min % 15: min + 15 - (min % 15)
        components.second = 0
        components.nanosecond = 0
        return calendar.date(from: components)!
    }

    /// Nearest half hour to date.
    ///
    ///     var date = Date() // "6:07 PM"
    ///     date.minute = 41 // "6:41 PM"
    ///     date.nearestHalfHour // "6:30 PM"
    ///
    ///     date.minute = 51 // "6:51 PM"
    ///     date.nearestHalfHour // "7:00 PM"
    ///
    var nearestHalfHour: Date {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
        let min = components.minute!
        components.minute! = min % 30 < 15 ? min - min % 30: min + 30 - (min % 30)
        components.second = 0
        components.nanosecond = 0
        return calendar.date(from: components)!
    }

    /// Nearest hour to date.
    ///
    ///     var date = Date() // "6:17 PM"
    ///     date.nearestHour // "6:00 PM"
    ///
    ///     date.minute = 36 // "6:36 PM"
    ///     date.nearestHour // "7:00 PM"
    ///
    var nearestHour: Date {
        let min = calendar.component(.minute, from: self)
        let components: Set<Calendar.Component> = [.year, .month, .day, .hour]
        let date = calendar.date(from: calendar.dateComponents(components, from: self))!

        if min < 30 {
            return date
        }
        return calendar.date(byAdding: .hour, value: 1, to: date)!
    }

    /// Yesterday date.
    ///
    ///     let date = Date() // "Oct 3, 2018, 10:57:11"
    ///     let yesterday = date.yesterday // "Oct 2, 2018, 10:57:11"
    ///
    var yesterday: Date {
        return calendar.date(byAdding: .day, value: -1, to: self) ?? Date()
    }

    /// Tomorrow's date.
    ///
    ///     let date = Date() // "Oct 3, 2018, 10:57:11"
    ///     let tomorrow = date.tomorrow // "Oct 4, 2018, 10:57:11"
    ///
    var tomorrow: Date {
        return calendar.date(byAdding: .day, value: 1, to: self) ?? Date()
    }

    /// UNIX timestamp from date.
    ///
    ///        Date().unixTimestamp -> 1484233862.826291
    ///
    var unixTimestamp: Double {
        return timeIntervalSince1970
    }

}

// MARK: - Methods
public extension Date {

    /// Date by adding multiples of calendar component.
    ///
    ///     let date = Date() // "Jan 12, 2017, 7:07 PM"
    ///     let date2 = date.adding(.minute, value: -10) // "Jan 12, 2017, 6:57 PM"
    ///     let date3 = date.adding(.day, value: 4) // "Jan 16, 2017, 7:07 PM"
    ///     let date4 = date.adding(.month, value: 2) // "Mar 12, 2017, 7:07 PM"
    ///     let date5 = date.adding(.year, value: 13) // "Jan 12, 2030, 7:07 PM"
    ///
    /// - Parameters:
    ///   - component: component type.
    ///   - value: multiples of components to add.
    /// - Returns: original date + multiples of component added.
    func adding(_ component: Calendar.Component, value: Int) -> Date {
        return calendar.date(byAdding: component, value: value, to: self)!
    }

    /// Add calendar component to date.
    ///
    ///     var date = Date() // "Jan 12, 2017, 7:07 PM"
    ///     date.add(.minute, value: -10) // "Jan 12, 2017, 6:57 PM"
    ///     date.add(.day, value: 4) // "Jan 16, 2017, 7:07 PM"
    ///     date.add(.month, value: 2) // "Mar 12, 2017, 7:07 PM"
    ///     date.add(.year, value: 13) // "Jan 12, 2030, 7:07 PM"
    ///
    /// - Parameters:
    ///   - component: component type.
    ///   - value: multiples of compnenet to add.
    mutating func add(_ component: Calendar.Component, value: Int) {
        if let date = calendar.date(byAdding: component, value: value, to: self) {
            self = date
        }
    }

    // swiftlint:disable cyclomatic_complexity function_body_length
    /// Date by changing value of calendar component.
    ///
    ///     let date = Date() // "Jan 12, 2017, 7:07 PM"
    ///     let date2 = date.changing(.minute, value: 10) // "Jan 12, 2017, 6:10 PM"
    ///     let date3 = date.changing(.day, value: 4) // "Jan 4, 2017, 7:07 PM"
    ///     let date4 = date.changing(.month, value: 2) // "Feb 12, 2017, 7:07 PM"
    ///     let date5 = date.changing(.year, value: 2000) // "Jan 12, 2000, 7:07 PM"
    ///
    /// - Parameters:
    ///   - component: component type.
    ///   - value: new value of compnenet to change.
    /// - Returns: original date after changing given component to given value.
    func changing(_ component: Calendar.Component, value: Int) -> Date? {
        switch component {
        case .nanosecond:
            let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentNanoseconds = calendar.component(.nanosecond, from: self)
            let nanosecondsToAdd = value - currentNanoseconds
            return calendar.date(byAdding: .nanosecond, value: nanosecondsToAdd, to: self)

        case .second:
            let allowedRange = calendar.range(of: .second, in: .minute, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentSeconds = calendar.component(.second, from: self)
            let secondsToAdd = value - currentSeconds
            return calendar.date(byAdding: .second, value: secondsToAdd, to: self)

        case .minute:
            let allowedRange = calendar.range(of: .minute, in: .hour, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentMinutes = calendar.component(.minute, from: self)
            let minutesToAdd = value - currentMinutes
            return calendar.date(byAdding: .minute, value: minutesToAdd, to: self)

        case .hour:
            let allowedRange = calendar.range(of: .hour, in: .day, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentHour = calendar.component(.hour, from: self)
            let hoursToAdd = value - currentHour
            return calendar.date(byAdding: .hour, value: hoursToAdd, to: self)

        case .day:
            let allowedRange = calendar.range(of: .day, in: .month, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentDay = calendar.component(.day, from: self)
            let daysToAdd = value - currentDay
            return calendar.date(byAdding: .day, value: daysToAdd, to: self)

        case .month:
            let allowedRange = calendar.range(of: .month, in: .year, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentMonth = calendar.component(.month, from: self)
            let monthsToAdd = value - currentMonth
            return calendar.date(byAdding: .month, value: monthsToAdd, to: self)

        case .year:
            guard value > 0 else { return nil }
            let currentYear = calendar.component(.year, from: self)
            let yearsToAdd = value - currentYear
            return calendar.date(byAdding: .year, value: yearsToAdd, to: self)

        default:
            return calendar.date(bySetting: component, value: value, of: self)
        }
    }
    #if !os(Linux)
        // swiftlint:enable cyclomatic_complexity, function_body_length

        /// Data at the beginning of calendar component.
        ///
        ///     let date = Date() // "Jan 12, 2017, 7:14 PM"
        ///     let date2 = date.beginning(of: .hour) // "Jan 12, 2017, 7:00 PM"
        ///     let date3 = date.beginning(of: .month) // "Jan 1, 2017, 12:00 AM"
        ///     let date4 = date.beginning(of: .year) // "Jan 1, 2017, 12:00 AM"
        ///
        /// - Parameter component: calendar component to get date at the beginning of.
        /// - Returns: date at the beginning of calendar component (if applicable).
        func beginning(of component: Calendar.Component) -> Date? {
            if component == .day {
                return calendar.startOfDay(for: self)
            }

            var components: Set<Calendar.Component> {
                switch component {
                case .second:
                    return [.year, .month, .day, .hour, .minute, .second]

                case .minute:
                    return [.year, .month, .day, .hour, .minute]

                case .hour:
                    return [.year, .month, .day, .hour]

                case .weekOfYear, .weekOfMonth:
                    return [.yearForWeekOfYear, .weekOfYear]

                case .month:
                    return [.year, .month]

                case .year:
                    return [.year]

                default:
                    return []
                }
            }

            guard !components.isEmpty else { return nil }
            return calendar.date(from: calendar.dateComponents(components, from: self))
        }
    #endif

    // swiftlint:disable function_body_length
    /// Date at the end of calendar component.
    ///
    ///     let date = Date() // "Jan 12, 2017, 7:27 PM"
    ///     let date2 = date.end(of: .day) // "Jan 12, 2017, 11:59 PM"
    ///     let date3 = date.end(of: .month) // "Jan 31, 2017, 11:59 PM"
    ///     let date4 = date.end(of: .year) // "Dec 31, 2017, 11:59 PM"
    ///
    /// - Parameter component: calendar component to get date at the end of.
    /// - Returns: date at the end of calendar component (if applicable).
    func end(of component: Calendar.Component) -> Date? {
        switch component {
        case .second:
            var date = adding(.second, value: 1)
            date = calendar.date(from:
                    calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date))!
            date.add(.second, value: -1)
            return date

        case .minute:
            var date = adding(.minute, value: 1)
            let after = calendar.date(from:
                    calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date))!
            date = after.adding(.second, value: -1)
            return date

        case .hour:
            var date = adding(.hour, value: 1)
            let after = calendar.date(from:
                    calendar.dateComponents([.year, .month, .day, .hour], from: date))!
            date = after.adding(.second, value: -1)
            return date

        case .day:
            var date = adding(.day, value: 1)
            date = calendar.startOfDay(for: date)
            date.add(.second, value: -1)
            return date

        case .weekOfYear, .weekOfMonth:
            var date = self
            let beginningOfWeek = calendar.date(from:
                    calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
            date = beginningOfWeek.adding(.day, value: 7).adding(.second, value: -1)
            return date

        case .month:
            var date = adding(.month, value: 1)
            let after = calendar.date(from:
                    calendar.dateComponents([.year, .month], from: date))!
            date = after.adding(.second, value: -1)
            return date

        case .year:
            var date = adding(.year, value: 1)
            let after = calendar.date(from:
                    calendar.dateComponents([.year], from: date))!
            date = after.adding(.second, value: -1)
            return date

        default:
            return nil
        }
    }
    // swiftlint:enable function_body_length

    /// Check if date is in current given calendar component.
    ///
    ///     Date().isInCurrent(.day) -> true
    ///     Date().isInCurrent(.year) -> true
    ///
    /// - Parameter component: calendar component to check.
    /// - Returns: true if date is in current given calendar component.
    func isInCurrent(_ component: Calendar.Component) -> Bool {
        return calendar.isDate(self, equalTo: Date(), toGranularity: component)
    }

    /// Date string from date.
    ///
    ///     Date().string(withFormat: "dd/MM/yyyy") -> "1/12/17"
    ///     Date().string(withFormat: "HH:mm") -> "23:50"
    ///     Date().string(withFormat: "dd/MM/yyyy HH:mm") -> "1/12/17 23:50"
    ///
    /// - Parameter format: Date format (default is "dd/MM/yyyy").
    /// - Returns: date string.
    func string(withFormat format: String = "dd/MM/yyyy HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    /// Date string from date.
    ///
    ///     Date().dateString(ofStyle: .short) -> "1/12/17"
    ///     Date().dateString(ofStyle: .medium) -> "Jan 12, 2017"
    ///     Date().dateString(ofStyle: .long) -> "January 12, 2017"
    ///     Date().dateString(ofStyle: .full) -> "Thursday, January 12, 2017"
    ///
    /// - Parameter style: DateFormatter style (default is .medium).
    /// - Returns: date string.
    func dateString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }

    /// Date and time string from date.
    ///
    ///     Date().dateTimeString(ofStyle: .short) -> "1/12/17, 7:32 PM"
    ///     Date().dateTimeString(ofStyle: .medium) -> "Jan 12, 2017, 7:32:00 PM"
    ///     Date().dateTimeString(ofStyle: .long) -> "January 12, 2017 at 7:32:00 PM GMT+3"
    ///     Date().dateTimeString(ofStyle: .full) -> "Thursday, January 12, 2017 at 7:32:00 PM GMT+03:00"
    ///
    /// - Parameter style: DateFormatter style (default is .medium).
    /// - Returns: date and time string.
    func dateTimeString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }

    /// Time string from date
    ///
    ///     Date().timeString(ofStyle: .short) -> "7:37 PM"
    ///     Date().timeString(ofStyle: .medium) -> "7:37:02 PM"
    ///     Date().timeString(ofStyle: .long) -> "7:37:02 PM GMT+3"
    ///     Date().timeString(ofStyle: .full) -> "7:37:02 PM GMT+03:00"
    ///
    /// - Parameter style: DateFormatter style (default is .medium).
    /// - Returns: time string.
    func timeString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = .none
        return dateFormatter.string(from: self)
    }

    /// Day name from date.
    ///
    ///     Date().dayName(ofStyle: .oneLetter) -> "T"
    ///     Date().dayName(ofStyle: .threeLetters) -> "Thu"
    ///     Date().dayName(ofStyle: .full) -> "Thursday"
    ///
    /// - Parameter Style: style of day name (default is DayNameStyle.full).
    /// - Returns: day name string (example: W, Wed, Wednesday).
    func dayName(ofStyle style: DayNameStyle = .full) -> String {
        // http://www.codingexplorer.com/swiftly-getting-human-readable-date-nsdateformatter/
        let dateFormatter = DateFormatter()
        var format: String {
            switch style {
            case .oneLetter:
                return "EEEEE"
            case .threeLetters:
                return "EEE"
            case .full:
                return "EEEE"
            }
        }
        dateFormatter.setLocalizedDateFormatFromTemplate(format)
        return dateFormatter.string(from: self)
    }

    /// Month name from date.
    ///
    ///     Date().monthName(ofStyle: .oneLetter) -> "J"
    ///     Date().monthName(ofStyle: .threeLetters) -> "Jan"
    ///     Date().monthName(ofStyle: .full) -> "January"
    ///
    /// - Parameter Style: style of month name (default is MonthNameStyle.full).
    /// - Returns: month name string (example: D, Dec, December).
    func monthName(ofStyle style: MonthNameStyle = .full) -> String {
        // http://www.codingexplorer.com/swiftly-getting-human-readable-date-nsdateformatter/
        let dateFormatter = DateFormatter()
        var format: String {
            switch style {
            case .oneLetter:
                return "MMMMM"
            case .threeLetters:
                return "MMM"
            case .full:
                return "MMMM"
            }
        }
        dateFormatter.setLocalizedDateFormatFromTemplate(format)
        return dateFormatter.string(from: self)
    }

    /// get number of seconds between two date
    ///
    /// - Parameter date: date to compate self to.
    /// - Returns: number of seconds between self and given date.
    func secondsSince(_ date: Date) -> Double {
        return timeIntervalSince(date)
    }

    /// get number of minutes between two date
    ///
    /// - Parameter date: date to compate self to.
    /// - Returns: number of minutes between self and given date.
    func minutesSince(_ date: Date) -> Double {
        return timeIntervalSince(date) / 60
    }

    /// get number of hours between two date
    ///
    /// - Parameter date: date to compate self to.
    /// - Returns: number of hours between self and given date.
    func hoursSince(_ date: Date) -> Double {
        return timeIntervalSince(date) / 3600
    }

    /// get number of days between two date
    ///
    /// - Parameter date: date to compate self to.
    /// - Returns: number of days between self and given date.
    func daysSince(_ date: Date) -> Double {
        return timeIntervalSince(date) / (3600 * 24)
    }

    /// check if a date is between two other dates
    ///
    /// - Parameters:
    ///   - startDate: start date to compare self to.
    ///   - endDate: endDate date to compare self to.
    ///   - includeBounds: true if the start and end date should be included (default is false)
    /// - Returns: true if the date is between the two given dates.
    func isBetween(_ startDate: Date, _ endDate: Date, includeBounds: Bool = false) -> Bool {
        if includeBounds {
            return startDate.compare(self).rawValue * compare(endDate).rawValue >= 0
        }
        return startDate.compare(self).rawValue * compare(endDate).rawValue > 0
    }

    /// check if a date is a number of date components of another date
    ///
    /// - Parameters:
    ///   - value: number of times component is used in creating range
    ///   - component: Calendar.Component to use.
    ///   - date: Date to compare self to.
    /// - Returns: true if the date is within a number of components of another date
    func isWithin(_ value: UInt, _ component: Calendar.Component, of date: Date) -> Bool {
        let components = calendar.dateComponents([component], from: self, to: date)
        let componentValue = components.value(for: component)!
        return abs(componentValue) <= value
    }

    /// Returns a random date within the specified range.
    ///
    /// - Parameter range: The range in which to create a random date. `range` must not be empty.
    /// - Returns: A random date within the bounds of `range`.
    static func random(in range: Range<Date>) -> Date {
        return Date(timeIntervalSinceReferenceDate:
                TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate..<range.upperBound.timeIntervalSinceReferenceDate))
    }

    /// Returns a random date within the specified range.
    ///
    /// - Parameter range: The range in which to create a random date.
    /// - Returns: A random date within the bounds of `range`.
    static func random(in range: ClosedRange<Date>) -> Date {
        return Date(timeIntervalSinceReferenceDate:
                TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate...range.upperBound.timeIntervalSinceReferenceDate))
    }

    /// Returns a random date within the specified range, using the given generator as a source for randomness.
    ///
    /// - Parameters:
    ///   - range: The range in which to create a random date. `range` must not be empty.
    ///   - generator: The random number generator to use when creating the new random date.
    /// - Returns: A random date within the bounds of `range`.
    static func random<T>(in range: Range<Date>, using generator: inout T) -> Date where T: RandomNumberGenerator {
        return Date(timeIntervalSinceReferenceDate:
                TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate..<range.upperBound.timeIntervalSinceReferenceDate,
                    using: &generator))
    }

    /// Returns a random date within the specified range, using the given generator as a source for randomness.
    ///
    /// - Parameters:
    ///   - range: The range in which to create a random date.
    ///   - generator: The random number generator to use when creating the new random date.
    /// - Returns: A random date within the bounds of `range`.
    static func random<T>(in range: ClosedRange<Date>, using generator: inout T) -> Date where T: RandomNumberGenerator {
        return Date(timeIntervalSinceReferenceDate:
                TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate...range.upperBound.timeIntervalSinceReferenceDate,
                    using: &generator))
    }

}

// MARK: - Initializers
public extension Date {

    /// Create a new date form calendar components.
    ///
    ///     let date = Date(year: 2010, month: 1, day: 12) // "Jan 12, 2010, 7:45 PM"
    ///
    /// - Parameters:
    ///   - calendar: Calendar (default is current).
    ///   - timeZone: TimeZone (default is current).
    ///   - era: Era (default is current era).
    ///   - year: Year (default is current year).
    ///   - month: Month (default is current month).
    ///   - day: Day (default is today).
    ///   - hour: Hour (default is current hour).
    ///   - minute: Minute (default is current minute).
    ///   - second: Second (default is current second).
    ///   - nanosecond: Nanosecond (default is current nanosecond).
    init?(
        calendar: Calendar? = Calendar.current,
        timeZone: TimeZone? = NSTimeZone.default,
        era: Int? = Date().era,
        year: Int? = Date().year,
        month: Int? = Date().month,
        day: Int? = Date().day,
        hour: Int? = Date().hour,
        minute: Int? = Date().minute,
        second: Int? = Date().second,
        nanosecond: Int? = Date().nanosecond) {

        var components = DateComponents()
        components.calendar = calendar
        components.timeZone = timeZone
        components.era = era
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond

        guard let date = calendar?.date(from: components) else { return nil }
        self = date
    }

    /// Create date object from ISO8601 string.
    ///
    ///     let date = Date(iso8601String: "2017-01-12T16:48:00.959Z") // "Jan 12, 2017, 7:48 PM"
    ///
    /// - Parameter iso8601String: ISO8601 string of format (yyyy-MM-dd'T'HH:mm:ss.SSSZ).
    init?(iso8601String: String) {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: iso8601String) else { return nil }
        self = date
    }

    /// Create new date object from UNIX timestamp.
    ///
    ///     let date = Date(unixTimestamp: 1484239783.922743) // "Jan 12, 2017, 7:49 PM"
    ///
    /// - Parameter unixTimestamp: UNIX timestamp.
    init(unixTimestamp: Double) {
        self.init(timeIntervalSince1970: unixTimestamp)
    }

    /// Create date object from Int literal
    ///
    ///     let date = Date(integerLiteral: 2017_12_25) // "2017-12-25 00:00:00 +0000"
    /// - Parameter value: Int value, e.g. 20171225, or 2017_12_25 etc.
    init?(integerLiteral value: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        guard let date = formatter.date(from: String(value)) else { return nil }
        self = date
    }

}

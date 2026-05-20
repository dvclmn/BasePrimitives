//
//  Date.swift
//  Collection
//
//  Created by Dave Coleman on 22/1/2025.
//

import Foundation

extension Date {

  public static var debug: String {
    Date.now.formatted(
      .dateTime
        .hour().minute().second()
        .secondFraction(.fractional(3))
    )
  }
  
  public func dayOfTheMonthIcon(day: Int? = nil) -> String {
    let today: Int = day ?? Calendar.current.component(.day, from: self)
    return "\(today).calendar"
  }

  // MARK: - (x) Ago

  public func secondsAgo(_ seconds: TimeInterval) -> Date {
    return Date().addingTimeInterval(-seconds)
  }

  public func minutesAgo(_ minutes: TimeInterval) -> Date {
    return Date().addingTimeInterval(-minutes * 60)
  }

  public func hoursAgo(_ hours: TimeInterval) -> Date {
    return Date().addingTimeInterval(-hours * 3600)
  }

  public func daysAgo(_ days: TimeInterval) -> Date {
    return Date().addingTimeInterval(-days * 86400)
  }

  // MARK: - (x) From Now

  /// Returns a date `seconds` seconds from now.
  public func secondsFromNow(_ seconds: TimeInterval) -> Date {
    return Date().addingTimeInterval(seconds)
  }

  /// Returns a date `minutes` minutes from now.
  public func minutesFromNow(_ minutes: TimeInterval) -> Date {
    return Date().addingTimeInterval(minutes * 60)
  }

  /// Returns a date `hours` hours from now.
  public func hoursFromNow(_ hours: TimeInterval) -> Date {
    return Date().addingTimeInterval(hours * 3600)
  }

  /// Returns a date `days` days from now.
  public func daysFromNow(_ days: TimeInterval) -> Date {
    return Date().addingTimeInterval(days * 86400)
  }
}

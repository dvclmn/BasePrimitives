//
//  Date.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 1/5/2026.
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
}

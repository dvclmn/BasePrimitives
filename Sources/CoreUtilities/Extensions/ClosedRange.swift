//
//  ClosedRange.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 21/4/2026.
//

import Foundation

extension ClosedRange {
  public var isZero: Bool { lowerBound == upperBound }
  public var isGreaterThanZero: Bool { lowerBound < upperBound }
  public var isGreaterThanOrEqualToZero: Bool { lowerBound <= upperBound }
}

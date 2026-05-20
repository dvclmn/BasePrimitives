//
//  Range.swift
//  ToolKit
//
//  Created by Dave Coleman on 1/5/2026.
//

import Foundation

extension Range {

  public var isZero: Bool { lowerBound == upperBound }
  public var isGreaterThanZero: Bool { lowerBound < upperBound }
  public var isGreaterThanOrEqualToZero: Bool { lowerBound <= upperBound }

}

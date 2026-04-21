//
//  Clamping.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 2/4/2026.
//

import Foundation
import CoreUtilities

extension Comparable where Self: BinaryFloatingPoint {
  public func clamped(toIntRange range: Range<Int>) -> Self {
    return clamped(Self(range.lowerBound), Self(range.upperBound))
  }
}

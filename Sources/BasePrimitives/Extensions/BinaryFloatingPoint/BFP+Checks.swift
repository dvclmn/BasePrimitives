//
//  BinaryFloatingPoint.swift
//  InteractionKit
//
//  Created by Dave Coleman on 29/3/2026.
//



//import Foundation
//
//extension BinaryFloatingPoint {
//
//  public func clampedIfNeeded(to range: ClosedRange<Self>?) -> Self {
//    guard let range else { return self }
//    return clamped(to: range)
//  }
//
//  public func clamped(to range: ClosedRange<Self>) -> Self {
//    let lower = range.lowerBound
//    let upper = range.upperBound
//
//    guard lower < upper else { return self }
//    return Swift.min(upper, Swift.max(lower, self))
//  }
//
//  public var isGreaterThanZero: Bool { self > 0 }
//  public var isFiniteAndGreaterThanZero: Bool { isFinite && self > 0 }
//  public var isGreaterThanOrEqualToZero: Bool { self >= 0 }
//}

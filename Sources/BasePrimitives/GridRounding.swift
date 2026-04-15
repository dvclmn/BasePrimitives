//
//  Rounding.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 14/10/2025.
//

import Foundation

/// ## Rounding options for fitting measurements into grid columns
///
/// When aligning text or hit-testing within a fixed cell grid, it is important
/// to round values consistently to avoid overflow or underflow beyond the grid edges.
///
/// - `.down`
///   Rounds toward zero (truncates) to ensure values never exceed the grid bounds.
/// - `.up`
///   Rounds upward (ceiling) to cover all visible pixels or reserve space for partial overlap.
/// - `.none`
///   Leaves the value unchanged.
///
/// Use cases include:
/// - Text measurement conversions to integer cell counts
/// - Hit-testing cell indices without overflow
/// - Visual alignment corrections and expansions
public enum Rounding: String, Sendable {
  case down
  case up
  case none

  public var name: String { rawValue.capitalized }

  fileprivate var rule: FloatingPointRoundingRule? {
    switch self {
      /// This was previously `.towardZero`. Not sure which it should be tbh
      case .down: .down
      case .up: .up
      case .none: nil
    }
  }

  /// Returns a CGFloat rounded using the selected Rounding rule, or unchanged if `.none`.
  public func roundedIfNeeded(_ value: CGFloat) -> CGFloat {
    guard let rule else {
      return value
    }
    return value.rounded(rule)
  }

  /// Returns an integer by rounding the value using the selected Rounding rule.
  ///
  /// Note: When rounding is `.none`, the value is still truncated toward zero
  /// by the `Int` conversion. There is no lossless float-to-Int path.
  public func roundedInt(_ value: CGFloat) -> Int {
    guard let rule else { return Int(value) }
    return Int(value.rounded(rule))
  }
}

extension BinaryFloatingPoint {
  
  /// Returns a floating-point value rounded using the specified Rounding rule.
  ///
  /// Example:
  /// ```
  /// let value: Double = 5.7
  /// let roundedDown = value.rounded(using: .down) // 5.0
  /// let roundedUp = value.rounded(using: .up)     // 6.0
  /// ```
  public func rounded(using rounding: Rounding) -> Self {
    guard let rule = rounding.rule else { return self }
    return self.rounded(rule)
  }

  /// Returns an integer rounded using the specified Rounding rule.
  ///
  /// Example:
  /// ```
  /// let value: Double = 5.7
  /// let intDown = value.roundedInt(using: .down) // 5
  /// let intUp = value.roundedInt(using: .up)     // 6
  /// ```
  public func roundedInt(using rounding: Rounding) -> Int {
    return rounding.roundedInt(CGFloat(self))
  }

  var fractionalPart: Self { self - self.rounded(.towardZero) }
}

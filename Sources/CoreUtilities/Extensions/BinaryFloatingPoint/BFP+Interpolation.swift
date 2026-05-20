//
//  BFP+Interpolation.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 17/2/2026.
//

import Foundation

extension BinaryFloatingPoint {

  /// Wrap into [0, 1)
  @inlinable public func wrappedUnit() -> Self {
    let r = self.truncatingRemainder(dividingBy: 1)
    return r >= 0 ? r : (r + 1)
  }

  /// Shortest signed delta from `self` to `other` on a unit circle, in (-0.5, 0.5]
  @inlinable public func shortestUnitDelta(towards other: Self) -> Self {
    let a = self.wrappedUnit()
    let b = other.wrappedUnit()
    var d = b - a
    if d > 0.5 { d -= 1 }
    if d <= -0.5 { d += 1 }  // choose a consistent tie-break
    return d
  }

  /// Hue interpolation on unit circle, returns a value in [0, 1)
  @inlinable public func interpolatedHue(towards other: Self, amount: Self) -> Self {
    (self.wrappedUnit() + shortestUnitDelta(towards: other) * amount).wrappedUnit()
  }

  /// Useful for Hue
  public var degrees: Self { self * 360 }
}

extension Optional where Wrapped: BinaryFloatingPoint {
  /// Linear interpolation for non-hue optionals.
  /// - If both are nil -> nil
  /// - If one is nil -> returns the non-nil
  /// - If both non-nil -> linear interpolate with `strength` in [0, 1]
  public func interpolated(
    towards other: Wrapped?,
    amount: Wrapped,
  ) -> Wrapped? {
    switch (self, other) {
      case (nil, nil): return nil
      case (let a?, nil): return a
      case (nil, let b?): return b
      case (let a?, let b?):
        let interpolated = Double(a).interpolated(
          towards: Double(b),
          amount: Double(amount),
        )
        return Wrapped(interpolated)
    }
  }
  public func interpolatedHue(
    towards other: Wrapped?,
    amount: Wrapped,
  ) -> Wrapped? {
    switch (self, other) {
      case (nil, nil): return nil
      case (let a?, nil): return a
      case (nil, let b?): return b
      case (let a?, let b?):
        return a.interpolatedHue(
          towards: b,
          amount: amount,
        )
    }
  }
}

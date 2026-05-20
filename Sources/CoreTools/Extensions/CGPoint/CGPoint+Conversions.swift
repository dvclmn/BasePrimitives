//
//  CGPoint+Conversions.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 30/1/2026.
//

import SwiftUI

extension CGPoint {
  public init(floatX: Float, floatY: Float) {
    self.init(x: Double(floatX), y: Double(floatY))
  }
  
  public init(fromSize size: CGSize) {
    self.init(x: size.width, y: size.height)
  }

  public init(fromLength length: CGFloat) {
    self.init(x: length, y: length)
  }

  public var toCGSize: CGSize {
    return CGSize(width: self.x, height: self.y)
  }
}

extension CGPoint {
  
  public var invertedY: CGPoint {
    CGPoint(x: x, y: -y)
  }
  
  public var invertedX: CGPoint {
    CGPoint(x: -x, y: y)
  }
  
  public static func angleInRadians(
    from p1: CGPoint,
    to p2: CGPoint
  ) -> CGFloat {
    atan2(p2.y - p1.y, p2.x - p1.x)
  }

  public static func angle(from p1: CGPoint, to p2: CGPoint) -> Angle {
    Angle(radians: angleInRadians(from: p1, to: p2))
  }
  
  
  /// Returns the relative UnitPoint (not snapped) within a given size.
  ///
  /// Usage:
  /// ```
  /// let point = CGPoint(x: 10, y: 5)
  /// let frameSize = CGSize(width: 100, height: 100)
  ///
  /// let closestAnchor = point.nearestAnchor(in: frameSize)
  /// print(closestAnchor)  // Might print `.topLeading` if point is near (0,0)
  /// ```
  public func toUnitPoint(
    in size: CGSize,
    rounding: FloatingPointRoundingRule = .down,
    fallback: UnitPoint = .center
  ) -> UnitPoint {
    
    guard size.isGreaterThanOrEqualToZero else { return fallback }
    
    let rawX = x / size.width
    let rawY = y / size.height
    
    let valX = rawX.rounded(rounding)
    let valY = rawY.rounded(rounding)
    
    return UnitPoint(x: valX, y: valY)
  }
}

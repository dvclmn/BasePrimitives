//
//  ZoomPanEnv.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 21/4/2026.
//

import SwiftUI

extension EnvironmentValues {

  @Entry public var panOffset: CGSize = .zero
  @Entry public var rotation: Angle = .zero

  /// Important: This zoom level is not clamped. Use ``zoomClamped``
  /// (which clamps by ``zoomRange``) if clamping is required
  @Entry public var zoomLevel: Double = 1.0

  @Entry public var zoomRange: ClosedRange<Double> = 0.2...10

  /// Returns `1.0` if `zoomLevel` is less than zero or NaN/infinite
  public var zoomClamped: Double {
    guard zoomLevel.isFiniteAndGreaterThanZero else { return 1.0 }
    return zoomLevel.clamped(to: zoomRange)
  }

}

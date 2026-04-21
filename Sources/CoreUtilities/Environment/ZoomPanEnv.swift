//
//  ZoomPanEnv.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 21/4/2026.
//

import SwiftUI

extension EnvironmentValues {
  
  /// Package BaseHelpers needs the below pan/rotation/zoom etc
  /// for `GridLineContext`. Going to suss whether to expose
  /// to BaseHelpers only via `@_spi(Internals)`, or whether
  /// it's fine that CanvasKit users will see these, as is.
  @Entry public var panOffset: CGSize = .zero
  @Entry public var rotation: Angle = .zero
  
  /// Important: This zoom level is not clamped. Use ``zoomClamped``
  /// which clamps by ``zoomRange`` if clamping is required
  
  @Entry public var zoomLevel: Double = 1.0
  
  /// This was previously optional, but trying out a default value instead
  @Entry public var zoomRange: ClosedRange<Double> = 0.2...10
  
  /// Will return unclamped if no zoom range found in the Environment
  package var zoomClamped: Double {
    guard zoomLevel.isFiniteAndGreaterThanZero else { return 1.0 }
    return zoomLevel.clamped(to: zoomRange)
  }

}

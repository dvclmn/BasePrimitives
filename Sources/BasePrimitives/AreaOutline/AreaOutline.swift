//
//  AreaOutline.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 5/4/2026.
//

import SwiftUI

@_spi(Internals) public struct AreaOutline {
  public let colour: Color
  public let rounding: Double
  public let lineWidth: Double

  public struct Resolved {
    public let rounding: Double
    public let width: Double
  }

  public init(
    colour: Color = .white.opacity(0.07),
    rounding: Double = 4,
    lineWidth: Double = 1,
  ) {
    self.colour = colour
    self.rounding = rounding
    self.lineWidth = lineWidth
  }
}

extension AreaOutline {
  /// See `BinaryFloatingPoint/removingZoom(_:across:sensitivity:)`
  /// for more information
  public func resolvedOutline(
    in environment: EnvironmentValues,
    sensitivity: Double? = nil,
  ) -> AreaOutline.Resolved {
    let rounding = rounding.removingZoom(
      environment.zoomLevel,
      across: environment.zoomRange,
      sensitivity: sensitivity,
    )
    let width = lineWidth.removingZoom(
      environment.zoomLevel,
      across: environment.zoomRange,
      sensitivity: sensitivity,
    )
    return .init(rounding: rounding, width: width)
  }
}

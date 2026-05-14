//
//  SwiftUI+Exts.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 13/5/2026.
//

import SwiftUI

extension AxisMapping {

  /// Converts a physical axis (SwiftUI.Axis) into your logical GeometryAxis.
  public func map(_ swiftUIAxis: Axis) -> GeometryAxis {
    let axis = swiftUIAxis.toGeometryAxis
    return map(axis)
  }
}

extension UnitPoint: AxisKeyPathWritable {
  public static var primaryWritableKey: WritableKeyPath<Self, CGFloat> { \.x }
  public static var secondaryWritableKey: WritableKeyPath<Self, CGFloat> { \.y }
}

extension EdgeInsets: AxisKeyPathWritable {
  public static var primaryWritableKey: WritableKeyPath<Self, CGFloat> { \.horizontalUniform }
  public static var secondaryWritableKey: WritableKeyPath<Self, CGFloat> { \.verticalUniform }
}

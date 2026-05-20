//
//  SwiftUI+Exts.swift
//  ToolKit
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


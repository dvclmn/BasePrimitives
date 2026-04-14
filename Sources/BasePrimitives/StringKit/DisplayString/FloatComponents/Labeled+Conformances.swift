//
//  FloatGroupConformances.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 4/10/2025.
//

import SwiftUI

extension CGPoint: FloatComponentsLabeled {
  public var components: [Labeled] {
    [
      .init("X", value: x),
      .init("Y", value: y),
    ]
  }
}

extension CGSize: FloatComponentsLabeled {
  public var components: [Labeled] {
    [
      .init("Width", abbreviated: "W", value: width),
      .init("Height", abbreviated: "H", value: height),
    ]
  }
}

extension NSRect: FloatComponentsLabeled {
  public var components: [Labeled] { origin.components + size.components }
}

extension UnitPoint: FloatComponentsLabeled {
  public var components: [Labeled] {
    [
      .init("X", value: x),
      .init("Y", value: y),
    ]
  }
}

extension CGVector: FloatComponentsLabeled {
  public var components: [Labeled] {
    [
      .init("DX", value: dx),
      .init("DY", value: dy),
    ]
  }
}

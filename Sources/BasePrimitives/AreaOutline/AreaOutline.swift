//
//  AreaOutline.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 5/4/2026.
//

import SwiftUI

public struct AreaOutline {
  public let colour: Color
  public let rounding: CGFloat
  public let lineWidth: CGFloat
  
  public init(
    colour: Color = .white.opacity(0.07),
    rounding: CGFloat = 4,
    lineWidth: CGFloat = 1,
  ) {
    self.colour = colour
    self.rounding = rounding
    self.lineWidth = lineWidth
  }
}

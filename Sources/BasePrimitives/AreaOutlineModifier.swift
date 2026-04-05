//
//  AreaOutlineModifier.swift
//  InteractionKit
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

struct AreaOutlineModifier: ViewModifier {

  @Environment(\.areaOutline) private var areaOutline
  @Environment(\.zoomClamped) private var zoomClamped
  @Environment(\.zoomRange) private var zoomRange

  let styleOverride: AreaOutline?

  init(
    colour: Color?,
    rounding: CGFloat?,
    lineWidth: CGFloat?,
  ) {
    guard let colour, let rounding, let lineWidth else {
      self.styleOverride = nil
      return
    }
    self.styleOverride = .init(
      colour: colour,
      rounding: rounding,
      lineWidth: lineWidth,
    )
  }

  func body(content: Content) -> some View {
    content
      .overlay {
        RoundedRectangle(cornerRadius: effectiveRounding)
          .fill(.clear)
          .stroke(effectiveColour, lineWidth: effectiveLineWidth)
          .allowsHitTesting(false)
      }
  }
}
extension AreaOutlineModifier {
  private var effectiveRounding: CGFloat {
    let base = styleOverride?.rounding ?? areaOutline.rounding
    return base.removingZoom(zoomClamped)
  }

  private var effectiveLineWidth: CGFloat {
    let base = styleOverride?.lineWidth.toDouble ?? areaOutline.lineWidth
    return base.removingZoom(zoomClamped, across: zoomRange)
  }

  private var effectiveColour: Color {
    styleOverride?.colour ?? areaOutline.colour
  }
}
extension View {
  /// If no values specifed, will default to Environment values
  public func areaOutline(
    colour: Color? = nil,
    rounding: CGFloat? = nil,
    lineWidth: CGFloat? = nil,
  ) -> some View {
    self.modifier(
      AreaOutlineModifier(
        colour: colour,
        rounding: rounding,
        lineWidth: lineWidth
      )
    )
  }
}

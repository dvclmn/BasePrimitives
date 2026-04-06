//
//  AreaOutlineModifier.swift
//  InteractionKit
//
//  Created by Dave Coleman on 5/4/2026.
//

import SwiftUI

struct AreaOutlineModifier: ViewModifier {

  @Environment(\.areaOutline) private var areaOutline
  @Environment(\.zoomClamped) private var zoomClamped
  @Environment(\.zoomRange) private var zoomRange

  let colour: Color?
  let rounding: CGFloat?
  let lineWidth: CGFloat?

  //  init(
  //    colour: Color?,
  //    rounding: CGFloat?,
  //    lineWidth: CGFloat?,
  //  ) {
  //    guard let colour, let rounding, let lineWidth else {
  //      self.styleOverride = nil
  //      return
  //    }
  //    self.styleOverride = .init(
  //      colour: colour,
  //      rounding: rounding,
  //      lineWidth: lineWidth,
  //    )
  //  }

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
    let base = rounding ?? areaOutline.rounding
    return base.removingZoom(zoomClamped)
  }

  private var effectiveLineWidth: CGFloat {
    let base = lineWidth?.toDouble ?? areaOutline.lineWidth
    return base.removingZoom(zoomClamped, across: zoomRange)
  }

  private var effectiveColour: Color {
    colour ?? areaOutline.colour
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
        lineWidth: lineWidth,
      )
    )
  }
}

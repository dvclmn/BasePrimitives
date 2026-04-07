//
//  AreaOutlineModifier.swift
//  InteractionKit
//
//  Created by Dave Coleman on 5/4/2026.
//

import SwiftUI

struct AreaOutlineModifier: ViewModifier {

  @Environment(\.areaOutline) private var areaOutline
  //  @Environment(\.zoomClamped) private var zoomClamped
  //  @Environment(\.zoomRange) private var zoomRange
  @Environment(\.self) private var env

  //  let colour: Color?
  //  let rounding: CGFloat?
  //  let lineWidth: CGFloat?

  let outline: AreaOutline

  func body(content: Content) -> some View {
    content
      .overlay {
        RoundedRectangle(cornerRadius: outline.resolvedOutline(in: env).rounding)
          .fill(.clear)
          .stroke(
            outline.colour,
            lineWidth: outline.resolvedOutline(in: env).width
          )
          .allowsHitTesting(false)
      }
  }
}

extension View {
  /// If no values specifed, will default to Environment values
  public func areaOutline(
    colour: Color = .white.opacity(0.07),
    rounding: Double = 4,
    lineWidth: Double = 1,
  ) -> some View {
    self.modifier(
      AreaOutlineModifier(
        outline: .init(
          colour: colour,
          rounding: rounding,
          lineWidth: lineWidth
        )
      )
    )
  }
}

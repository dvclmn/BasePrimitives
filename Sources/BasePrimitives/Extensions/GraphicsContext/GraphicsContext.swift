//
//  GraphicsContext.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 5/3/2026.
//

import SwiftUI

extension GraphicsContext {

  /// `removeZoom` affects `strokeThickness` only
  public func fillAndStroke(
    _ path: Path,
    fillColour: Color = .blue.opacity(0.4),
    strokeColour: Color = .indigo,
    strokeThickness: CGFloat = 1,
//    removeZoom: Bool = true
  ) {
    self.fill(
      path,
      with: .color(fillColour)
    )

    self.stroke(
      path,
      with: .color(strokeColour),
      lineWidth: strokeThickness
      
      /// See CanvasKit for `unZoomedLineWidth(for:)`
//      lineWidth: removeZoom ? unZoomedLineWidth(for: strokeThickness) : strokeThickness
    )
  }
}



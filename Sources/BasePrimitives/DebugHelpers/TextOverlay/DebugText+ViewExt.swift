//
//  DebugText+ViewExt.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 16/4/2026.
//

import SwiftUI

extension View {
  public func debugTextOverlay(alignment: Alignment = .bottomLeading) -> some View {
    modifier(DebugTextOverlayModifier(alignment: alignment))
  }

  public func debugText(
    _ text: String,
  ) -> some View {
    modifier(DebugItemModifier(text: text))
  }
  
  public func debugText(
    @DisplayStringBuilder _ text: () -> [DisplayBlock]
  ) -> some View {
    modifier(DebugItemModifier(text: text().output()))
  }
}

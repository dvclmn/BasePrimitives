//
//  DebugText+ViewExt.swift
//  ToolKit
//
//  Created by Dave Coleman on 16/4/2026.
//

import SwiftUI

extension View {
  public func debugTextOverlay(
    isEnabled: Bool = true,
    alignment: Alignment = .bottomLeading,
  ) -> some View {
    modifier(
      DebugTextOverlayModifier(
        isEnabled: isEnabled,
        alignment: alignment,
      )
    )
  }

  public func debugText(
    isEnabled: Bool = true,
    _ text: String
  ) -> some View {
    modifier(DebugItemModifier(text: text))
  }

  public func debugText(
    isEnabled: Bool = true,
    @DisplayStringBuilder _ text: () -> [DisplayBlock]
  ) -> some View {
    modifier(DebugItemModifier(text: text().output()))
  }
}

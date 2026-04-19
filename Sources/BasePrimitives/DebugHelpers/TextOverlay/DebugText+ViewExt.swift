//
//  DebugText+ViewExt.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 16/4/2026.
//

import SwiftUI

public enum DebugItemState {
  case useEnvironment
  case createNow
}

extension View {
  /// If no store provided, will attempt to use one in the Environment, if present.
  public func debugTextOverlay(
    state: DebugItemState = .createNow,
    //    store: DebugItemStore? = nil,
    isEnabled: Bool = true,
    alignment: Alignment = .bottomLeading,
  ) -> some View {
    modifier(
      DebugTextOverlayModifier(
        store: state == .createNow ? .init() : nil,
        isEnabled: isEnabled,
        alignment: alignment,
      )
    )
  }

  public func debugText(
    _ text: String
  ) -> some View {
    modifier(DebugItemModifier(text: text))
  }

  public func debugText(
    @DisplayStringBuilder _ text: () -> [DisplayBlock]
  ) -> some View {
    modifier(DebugItemModifier(text: text().output()))
  }
}

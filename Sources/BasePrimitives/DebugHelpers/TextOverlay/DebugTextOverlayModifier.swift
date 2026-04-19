//
//  DebugTextModifier.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 16/4/2026.
//

import SwiftUI

extension EnvironmentValues {
  @Entry var debugItemStore: DebugItemStore? = nil
}

struct DebugTextOverlayModifier: ViewModifier {
  @Environment(DebugItemStore.self) private var store: DebugItemStore?

  let isEnabled: Bool
  var alignment: Alignment

  init(
    store: DebugItemStore?,
    isEnabled: Bool,
    alignment: Alignment,
  ) {
    self._store = Environment(DebugItemStore.self)
    self.isEnabled = isEnabled
    self.alignment = alignment
  }

  func body(content: Content) -> some View {
    content
      .overlay(alignment: alignment) {
        if isEnabled {
          DebugItemsOverlayView()
        }
      }
      .environment(store)
  }
}

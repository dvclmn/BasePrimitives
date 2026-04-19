//
//  DebugTextModifier.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 16/4/2026.
//

import SwiftUI

struct DebugTextOverlayModifier: ViewModifier {
  @State private var store = DebugItemStore()

  let isEnabled: Bool
  var alignment: Alignment

  func body(content: Content) -> some View {
    content
      .overlay(alignment: alignment) {
        if isEnabled {
          DebugItemsOverlayView(store: store)
        }
      }
      .environment(store)
  }
}


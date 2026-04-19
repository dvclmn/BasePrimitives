//
//  DebugTextModifier.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 16/4/2026.
//

import SwiftUI

struct DebugTextOverlayModifier: ViewModifier {
  @Environment(DebugItemStore.self) private var inheritedStore: DebugItemStore?
  @State private var ownedStore = DebugItemStore()

  let isEnabled: Bool
  var alignment: Alignment

  func body(content: Content) -> some View {
    if inheritedStore != nil {
      /// A store already exists higher up — become a transparent pass-through.
      /// Any .debugItem(...) descendants will write to the inherited store naturally.
      content
    } else {
      /// We're the canonical host — own the store, inject it, render the overlay.
      content
        .environment(ownedStore)
        .overlay(alignment: alignment) {
          if isEnabled {
            DebugItemsOverlayView(store: ownedStore)
          }
        }
    }
  }
}

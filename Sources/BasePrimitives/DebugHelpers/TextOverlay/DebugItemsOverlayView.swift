//
//  DebugTextSimpleModifier.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 13/3/2026.
//

import SwiftUI

struct DebugItemModifier: ViewModifier {
  @Environment(DebugItemStore.self) private var store: DebugItemStore?

  let text: String
  @State private var id = UUID()

  func body(content: Content) -> some View {
    content
      .onChange(of: text, initial: true) { _, newValue in
        store?.set(newValue, for: id)
      }
      .onDisappear {
        store?.remove(for: id)
      }
      .overlay {
        if store == nil {
          StateView(
            "`DebugItemStore` missing from environment",
            icon: .emojiComposition(.example),
            message:
              "Ensure you add modifier `debugTextOverlay(alignment:)` somewhere high up in your project's view hierarchy.",
          )
        }
      }
  }
}

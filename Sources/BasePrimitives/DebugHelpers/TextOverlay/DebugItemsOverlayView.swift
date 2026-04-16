//
//  DebugTextSimpleModifier.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 13/3/2026.
//

import SwiftUI

struct DebugItemsOverlayView: View {
  @Environment(\.colourOverride) private var colourOverride

  var store: DebugItemStore

  var body: some View {

    if !store.items.isEmpty {
      VStack(alignment: .leading, spacing: 2) {
        ForEach(store.items) { item in
          Text(item.text)
            .font(.caption)
            .monospaced()
        }
      }
      .padding(Styles.sizeTiny)
      .background(.regularMaterial)
      .background(colourOverride?.opacityLow)
      .clipShape(.rect(cornerRadius: 3))
      .padding()
      .allowsHitTesting(false)

    } else {
      Text("No debug items")
    }

  }
}

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
          Circle().fill(Color.orange.tertiary)
        }
      }
  }
}

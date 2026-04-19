//
//  ItemsOverlayView.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 19/4/2026.
//

import SwiftUI

struct DebugItemsOverlayView: View {
  @Environment(DebugItemStore.self) private var store: DebugItemStore?
  @Environment(\.colourOverride) private var colourOverride

  var body: some View {

    if let store, !store.items.isEmpty {
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

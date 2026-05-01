//
//  ItemsOverlayView.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 19/4/2026.
//

import SwiftUI

struct DebugItemsOverlayView: View {
//  @Environment(\.colourOverride) private var colourOverride

  let store: DebugItemStore
  var body: some View {

    if !store.items.isEmpty {
      VStack(alignment: .leading, spacing: 2) {
        ForEach(store.items) { item in
          Text(item.text)
            .font(.caption)
            .monospaced()
        }
      }
      .padding(4)
      .background(.regularMaterial)
//      .background(colourOverride?.opacityLow)
      .clipShape(.rect(cornerRadius: 3))
      .padding()
      .allowsHitTesting(false)

    } else {
      Text("No debug items")
    }

  }
}

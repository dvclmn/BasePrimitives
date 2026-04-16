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

  //  let text: String
  //  let isEnabled: Bool

  //  let padding: (Edge.Set, CGFloat?)

  var body: some View {

    if !store.items.isEmpty {
      //          Text(text)
      VStack(alignment: .leading, spacing: 2) {
        ForEach(store.items) { item in
          Text(item.text)
            //                .font(.system(.caption2, design: .monospaced))
            .font(.caption)
            .monospaced()
        }
      }
      //          .fixedSize(horizontal: true, vertical: false)
      .padding(Styles.sizeTiny)
      .background(.regularMaterial)
      //            .background(.black.opacityLow)
      
      //            .background(TintShapeStyle())
      .background(colourOverride?.opacityLow)
      .clipShape(.rect(cornerRadius: 3))
      .padding()
      //          .safeAreaPadding(padding.0, padding.1)
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

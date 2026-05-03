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
  let alignment: Alignment
  var body: some View {

    if !store.items.isEmpty {

      ScrollView {

//        Spacer()
//          .containerRelativeFrame([.vertical])
        
        VStack(spacing: 2) {
//        VStack(alignment: alignment.horizontal, spacing: 2) {
          ForEach(store.items) { item in
            Text(item.text)
              .font(.caption)
              .monospaced()
          }
        }
        .padding(5)
        .background(.regularMaterial)
        .clipShape(.rect(cornerRadius: 3))
        .padding()

        //        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
      }
      .scrollIndicators(.hidden)
      .defaultScrollAnchorCompatible(alignment.toUnitPoint(fallback: .center), for: .alignment)
      //      .scrollContentBackground(.hidden)
      //      .scrollDisabled(true)
      //      .allowsHitTesting(false)

    } else {
      Text("No debug items")
    }

  }
}

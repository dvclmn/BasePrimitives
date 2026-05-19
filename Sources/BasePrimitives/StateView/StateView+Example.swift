//
//  StateView+Example.swift
//  Components
//
//  Created by Dave Coleman on 7/2/2025.
//

import SwiftUI

struct StateViewExample: View {

  @State private var controlSize: ControlSize = .regular

  var body: some View {

    VStack {
      StateView(
        "Normal view",
        icon: .symbol(Icons.binoculars.icon),
        message: "I'm a view with a normal size.",
        //        icon: Icon.emoji("🐠")
      ) {
        Button {

        } label: {
          Label("Example button", systemImage: "plus")
        }
      }

      ContentUnavailableView {
        Label("Normal view", systemImage: Icons.binoculars.icon)
      } description: {
        Text("I'm a view with a normal size.")
      } actions: {
        Button {

        } label: {
          Label("Example button", systemImage: "plus")
        }
      }
    }
    .controlSize(controlSize)
    .symbolVariant(.fill)
    .symbolRenderingMode(.hierarchical)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .safeAreaInset(edge: .bottom) {
      Picker("Size", selection: $controlSize) {
        ForEach(ControlSize.allCases) { size in
          Text(size.displayName).tag(size)
        }
      }
      .pickerStyle(.segmented)

    }

    //    .toolbar {
    //      ToolbarItem {
    //      }
    //    }

    //      ContentUnavailableView(
    //        "Normal view",
    //        systemImage: Icons.binoculars.icon,
    //        description: Text("I'm a view with a normal size."),
    //      )

    //      MultiItemView("Butts", data: [1, 2, 3]) { item in
    //        Text(item.string)
    //      }
    //
    //      StateView(
    //        title: "I'm a mini view",
    //        message: "Action label",
    //        icon: Icon.emoji("🐠")
    //      ) {
    //        Button {
    //
    //        } label: {
    //          Label("Example button", systemImage: "plus")
    //        }
    //      }
    //
    //      StateView(
    //        title: "Here is a title",
    //        message: "Action label. I'm a small size.",
    //        icon: Icon.symbol(Icons.getRandomIcon),
    //        itemCount: 6
    //      ) {
    //        Button {
    //
    //        } label: {
    //          Label("Example button", systemImage: "plus")
    //        }
    //      }

    //    }
  }
}

#if DEBUG
#Preview {
  StateViewExample()
    .padding(40)
    .frame(width: 600, height: 700)
    .background(.black.opacity(0.6))
}
#endif

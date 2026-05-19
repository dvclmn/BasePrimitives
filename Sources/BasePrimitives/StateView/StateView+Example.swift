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

    ScrollView {
      ForEach(ControlSize.allCases) { size in
        StateViewComparison(
          title: content(size).0,
          icon: content(size).1,
          message: content(size).2,
        )
        
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    .controlSize(controlSize)
    .symbolVariant(.fill)
    .symbolRenderingMode(.hierarchical)

//    .padding(40)
    .frame(width: 600, height: 700)
    .background(.black.opacity(0.6))
    //    .safeAreaInset(edge: .bottom) {
    //      Picker("Size", selection: $controlSize) {
    //        ForEach(ControlSize.allCases) { size in
    //          Text(size.displayName).tag(size)
    //        }
    //      }
    //      .pickerStyle(.segmented)
    //
    //    }
  }
}
extension StateViewExample {
  private func content(_ size: ControlSize) -> (String, String, String) {
    return (
      "This is a title",
      Icons.boat.icon,
      "I'm a view with \(size.displayName) size.",
    )
  }
}

#if DEBUG
#Preview {
  StateViewExample()
}
#endif

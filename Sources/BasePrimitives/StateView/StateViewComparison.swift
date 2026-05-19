//
//  StateViewComparison.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 19/5/2026.
//

import SwiftUI

struct StateViewComparison: View {

  let title: String
  let icon: String
  let message: String
  var body: some View {

    VStack {
      Group {
        StateView(
          title,
          icon: .symbol(icon),
          message: message,
        ) {
          ExampleButton()
        }

        ContentUnavailableView {
          Label(title, systemImage: icon)
        } description: {
          Text(message)
        } actions: {
          ExampleButton()
        }
      }
      //      .border(Color.green.opacity(0.3))
    }

  }
}

extension StateViewComparison {
  @ViewBuilder
  private func ExampleButton() -> some View {
    Button {

    } label: {
      Label("Example button", systemImage: "plus")
    }
  }
}

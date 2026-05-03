//
//  Compat+GlassButtonStyle.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 3/5/2026.
//

import SwiftUI

//extension PrimitiveButtonStyle where Self == GlassProminentButtonStyleCompatible

enum GlassButtonStyle {
  case glass
  case glassProminent
}

struct GlassProminentButtonStyleCompatible: PrimitiveButtonStyle {

  let style: GlassButtonStyle
  func makeBody(configuration: Configuration) -> some View {

    if #available(macOS 26, iOS 26, *) {

      switch style {
        case .glass:
          Button(configuration)
            .buttonStyle(.glass)

        case .glassProminent:
          Button(configuration)
            .buttonStyle(.glassProminent)
      }

    } else {
      Button(configuration)
    }

  }
}

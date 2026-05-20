//
//  Compat+GlassButtonStyle.swift
//  ToolKit
//
//  Created by Dave Coleman on 3/5/2026.
//

import SwiftUI

extension PrimitiveButtonStyle where Self == GlassProminentButtonStyleCompatible {
  public static var glassCompatible: Self { .init(style: .glass) }
  public static var glassProminentCompatible: Self { .init(style: .glassProminent) }
}

enum GlassButtonStyle {
  case glass
  case glassProminent
}

public struct GlassProminentButtonStyleCompatible: PrimitiveButtonStyle {

  let style: GlassButtonStyle
  public func makeBody(configuration: Configuration) -> some View {

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

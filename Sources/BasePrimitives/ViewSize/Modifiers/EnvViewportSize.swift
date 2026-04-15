//
//  ViewportSize.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 10/8/2025.
//

import SwiftUI

/// Represents the full App Window dimensions, sans
/// UI elements like sidebar, inspector, toolbar etc.
public struct EnvironmentViewportRectModifier: ViewModifier {
  @State private var viewportRect: CGRect?

  let mode: DebounceMode

  public func body(content: Content) -> some View {
    content
      .viewSize(capture: .safeAreaRect, mode: mode) {
        self.viewportRect = $0.rect
      }
      .environment(\.viewportRect, viewportRect)
  }
}

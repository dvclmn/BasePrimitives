//
//  ViewExtensions.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 30/10/2025.
//

import SwiftUI

// MARK: - View size modifiers
extension View {

  public func viewSize<T: GeometryCapturable>(
    capture: GeometryCapture<T> = .size,
    mode debounceMode: DebounceMode,
    isEnabled: Bool = true,
    valueOutput: @escaping ViewSizeOutput<T>,
  ) -> some View {
    self.modifier(
      ViewSizeModifier(
        capture: capture,
        mode: debounceMode,
        isEnabled: isEnabled,
        valueOutput: valueOutput
      )
    )
  }

  /// This adds a `viewportSize` and `viewportRect`
  /// to the environment. `viewportRect` expresses both
  /// viewport size, and also safe area insets.
  ///
  /// If a callback is needed, see ``viewSize(capture:mode:isEnabled:valueOutput:)``
  public func viewportCapture(
    mode debounceMode: DebounceMode,
    //    showsIndicator: Bool = false,
  ) -> some View {
    self.modifier(
      EnvironmentViewportSizeModifier(
        mode: debounceMode,
        //        showsIndicator: showsIndicator
      )
    )
  }
}

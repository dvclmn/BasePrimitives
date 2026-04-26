//
//  DebouncedChange.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 23/4/2026.
//

import SwiftUI

struct DebouncedChangeModifier<V: Equatable>: ViewModifier {
  let value: V
  let initial: Bool
  let interval: TimeInterval
  let leading: Bool
  let action: @MainActor @Sendable (_ oldValue: V, _ newValue: V) async -> Void

  @State private var debouncer: AsyncDebouncer = .init()
  @State private var lastStableValue: V?

  func body(content: Content) -> some View {
    content
      .onAppear {
        /// Set the initial stable value when the view loads
        lastStableValue = value
      }
      .onChange(of: value, initial: initial) { _, newValue in
        let trigger: @MainActor @Sendable () async -> Void = {
          let old = lastStableValue ?? newValue
          guard updateIfChanged(&lastStableValue, to: newValue) else { return }
          await action(old, newValue)
        }

        if leading {
          debouncer.executeLeading(action: trigger)
        } else {
          debouncer.execute(action: trigger)
        }
      }
  }
}

/// Example use:
/// ```
/// TextField("Search...", text: $searchText)
///   .onDebouncedChange(of: searchText, interval: 0.5) { old, new in
///     print("Debounced from '\(old)' to '\(new)'")
///     // Perform your heavy async search request here
///   }
/// ```
extension View {
  /// Adds a debounced action to perform when a specific value changes.
  public func onDebouncedChange<V: Equatable>(
    of value: V,
    initial: Bool = false,
    interval: TimeInterval = 0.2,
    leading: Bool = false,
    _ action: @escaping @MainActor @Sendable (_ oldValue: V, _ newValue: V) async -> Void,
  ) -> some View {
    modifier(
      DebouncedChangeModifier(
        value: value,
        initial: initial,
        interval: interval,
        leading: leading,
        action: action,
      )
    )
  }
}

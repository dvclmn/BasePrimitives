//
//  DebounceTaskModifier.swift
//  Collection
//
//  Created by Dave Coleman on 22/9/2024.
//

import SwiftUI

public struct DebouncedTaskViewModifier<ID: Equatable>: ViewModifier {
  @State private var debouncer: AsyncDebouncer
  let id: ID
  let action: () async -> Void

  public init(
    id: ID,
    interval: TimeInterval,
    action: @escaping @Sendable () async -> Void,
  ) {
    self.id = id
    self._debouncer = State(initialValue: AsyncDebouncer(interval: interval))
    self.action = action
  }
  public func body(content: Content) -> some View {
    content
      .task(id: id) {
        debouncer.execute { @MainActor in
          await action()
        }
      }
  }
}
extension View {
  public func debouncedTask<ID: Equatable>(
    id: ID,
    interval: TimeInterval = 0.2,
    action: @escaping @Sendable () async -> Void,
  ) -> some View {
    self.modifier(
      DebouncedTaskViewModifier(
        id: id,
        interval: interval,
        action: action,
      )
    )
  }
}

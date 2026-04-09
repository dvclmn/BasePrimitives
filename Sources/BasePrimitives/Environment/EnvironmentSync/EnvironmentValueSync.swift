//
//  ModifierKeySync.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 21/3/2026.
//

import SwiftUI

struct EnvironmentSyncModifier<Value, ID: Equatable>: ViewModifier {

  @Environment private var value: Value
  let id: (Value) -> ID
  let action: (Value) -> Void

  init(
    _ keyPath: KeyPath<EnvironmentValues, Value>,
    id: @escaping (Value) -> ID,
    action: @escaping (Value) -> Void,
  ) {
    _value = Environment(keyPath)
    self.id = id
    self.action = action
  }

  func body(content: Content) -> some View {
    content.task(id: id(value)) { action(value) }
  }
}

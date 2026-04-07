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
  let apply: (Value) -> Void

  init(
    _ keyPath: KeyPath<EnvironmentValues, Value>,
    id: @escaping (Value) -> ID,
    apply: @escaping (Value) -> Void,
  ) {
    _value = Environment(keyPath)
    self.id = id
    self.apply = apply
  }

  func body(content: Content) -> some View {
    content.task(id: id(value)) { apply(value) }
  }
}

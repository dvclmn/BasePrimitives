//
//  ModifierKeySync.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 21/3/2026.
//

import SwiftUI

private struct EnvironmentSyncModifier<Value, ID: Equatable>: ViewModifier {

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

extension View {

  /// Synchronize an optional environment value into a binding.
  ///
  /// Mirrors the value at `keyPath` from the environment into `binding` whenever it changes.
  /// Use this when you simply want to keep local state in sync with an environment value.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - binding: The destination binding that should reflect the environment value.
  ///
  /// - Note: Updates are driven by an internal identity derived from the value. See the
  ///   overloads that accept `using:` or `id:` if you need to control when updates fire.

  public func syncEnvironment<Value: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value?>,
    to binding: Binding<Value?>,
  ) -> some View {
    syncEnvironment(keyPath) { binding.wrappedValue = $0 }
  }

  /// Synchronize an optional environment value into a binding, identified by a key path.
  ///
  /// Extracts an identity from the observed value using `idKeyPath` to determine when to
  /// propagate changes to `binding`. Useful when `Value` is not `Equatable` or when you only
  /// want updates for a specific field.
  ///
  /// Example:
  /// ```swift
  /// struct MyEnv { var token: UUID; var payload: Data }
  /// @State private var env: MyEnv?
  /// SomeView()
  ///   .syncEnvironment(\.myEnv, using: \.?.token, to: $env)
  /// ```
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - idKeyPath: A key path that produces an `Equatable` identity from the value.
  ///   - binding: The destination binding that should reflect the environment value.
  public func syncEnvironment<Value, ID: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value?>,
    using idKeyPath: KeyPath<Value?, ID>,
    to binding: Binding<Value?>,
  ) -> some View {
    syncEnvironment(keyPath, id: { $0[keyPath: idKeyPath] }, to: binding)
  }

  /// Synchronize an optional environment value into a binding, with a custom identity.
  ///
  /// Uses the supplied `id` closure to compute an `Equatable` identity from the value to
  /// control when updates are propagated to `binding`.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - id: A closure that computes an `Equatable` identity from the current value.
  ///   - binding: The destination binding that should reflect the environment value.
  ///
  /// - Example:
  /// ```swift
  /// .syncEnvironment(\.myEnv, id: { $0?.token ?? UUID() }, to: $env)
  /// ```
  public func syncEnvironment<Value, ID: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value?>,
    id: @escaping (Value?) -> ID,
    to binding: Binding<Value?>,
  ) -> some View {
    syncEnvironment(keyPath, id: id) { binding.wrappedValue = $0 }
  }

  /// Observe a non-optional environment value and perform an action when it changes.
  ///
  /// Calls `apply` with the current value at `keyPath` as the view appears and whenever the
  /// value changes. Requires `Value` to be `Equatable` to detect changes efficiently.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - apply: A closure invoked with the latest value.
  ///
  /// - Example:
  /// ```swift
  /// .syncEnvironment(\.dismiss) { dismiss in
  ///   // stash or react to dismiss action
  /// }
  /// ```
  public func syncEnvironment<Value: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value>,
    apply: @escaping (Value) -> Void,
  ) -> some View {
    modifier(EnvironmentSyncModifier(keyPath, id: { $0 }, apply: apply))
  }

  /// Observe an optional environment value and perform an action when its identity changes.
  ///
  /// Extracts an identity from the value using `idKeyPath` and calls `apply` whenever that
  /// identity changes. Useful when `Value` is not `Equatable` or you only care about changes
  /// to a particular field.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - idKeyPath: A key path that produces an `Equatable` identity from the value.
  ///   - apply: A closure invoked with the latest value.
  ///
  /// - Example:
  /// ```swift
  /// .syncEnvironment(\.myEnv, using: \.?.token) { env in
  ///   // react to token changes only
  /// }
  /// ```
  public func syncEnvironment<Value, ID: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value?>,
    using idKeyPath: KeyPath<Value?, ID>,
    apply: @escaping (Value?) -> Void,
  ) -> some View {
    syncEnvironment(keyPath, id: { $0[keyPath: idKeyPath] }, apply: apply)
  }

  /// Observe an optional environment value and perform an action, with a custom identity.
  ///
  /// Uses the supplied `id` closure to compute an `Equatable` identity from the value and
  /// calls `apply` whenever that identity changes.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - id: A closure that computes an `Equatable` identity from the current value.
  ///   - apply: A closure invoked with the latest value.
  ///
  /// - Example:
  /// ```swift
  /// .syncEnvironment(\.myEnv, id: { $0?.token ?? UUID() }) { env in
  ///   // react to identity changes
  /// }
  /// ```
  public func syncEnvironment<Value, ID: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value?>,
    id: @escaping (Value?) -> ID,
    apply: @escaping (Value?) -> Void,
  ) -> some View {
    modifier(EnvironmentSyncModifier(keyPath, id: id, apply: apply))
  }

}

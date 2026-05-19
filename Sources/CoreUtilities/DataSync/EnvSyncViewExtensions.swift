//
//  EnvSyncViewExtensions.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 7/4/2026.
//

import SwiftUI

extension View {

  // MARK: - Binding Sync (Non-Optional)

  /// Synchronize an environment value into a binding.
  ///
  /// Mirrors the value at `keyPath` from the environment into `binding` whenever it changes.
  /// Use this when you simply want to keep local state in sync with an environment value.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - binding: The destination binding that should reflect the environment value.
  ///
  /// - Example:
  /// ```swift
  /// @Environment(\.scenePhase) private var scenePhase
  /// @State private var currentPhase: ScenePhase?
  ///
  /// ContentView()
  ///   .syncEnvironment(\.scenePhase, to: $currentPhase)
  /// ```
  public func syncEnvironment<Value: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value>,
    to binding: Binding<Value>,
  ) -> some View {
    modifier(EnvironmentSyncModifier(keyPath, id: { $0 }, action: { binding.wrappedValue = $0 }))
  }

  /// Synchronize an environment value into a binding using a custom identity.
  ///
  /// Uses the supplied `id` closure to compute an `Equatable` identity from the value to
  /// control when updates are propagated to `binding`. Useful when `Value` is not `Equatable`
  /// or when you only want updates based on a specific property.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - id: A closure that computes an `Equatable` identity from the current value.
  ///   - binding: The destination binding that should reflect the environment value.
  ///
  /// - Example:
  /// ```swift
  /// struct MyEnv { var token: UUID; var payload: Data }
  /// @State private var env: MyEnv
  ///
  /// SomeView()
  ///   .syncEnvironment(\.myEnv, id: \.token, to: $env)
  /// ```
  public func syncEnvironment<Value, ID: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value>,
    id: @escaping (Value) -> ID,
    to binding: Binding<Value>,
  ) -> some View {
    modifier(EnvironmentSyncModifier(keyPath, id: id, action: { binding.wrappedValue = $0 }))
  }

  // MARK: - Binding Sync (Optional)

  /// Synchronize an optional environment value into a binding.
  ///
  /// Mirrors the value at `keyPath` from the environment into `binding` whenever it changes.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - binding: The destination binding that should reflect the environment value.
  public func syncEnvironment<Value: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value?>,
    to binding: Binding<Value?>,
  ) -> some View {
    modifier(EnvironmentSyncModifier(keyPath, id: { $0 }, action: { binding.wrappedValue = $0 }))
  }

  /// Synchronize an optional environment value into a binding using a custom identity.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - id: A closure that computes an `Equatable` identity from the current value.
  ///   - binding: The destination binding that should reflect the environment value.
  ///
  /// - Example:
  /// ```swift
  /// struct MyEnv { var token: UUID; var payload: Data }
  /// @State private var env: MyEnv?
  ///
  /// SomeView()
  ///   .syncEnvironment(\.myEnv, id: { $0?.token }, to: $env)
  /// ```
  public func syncEnvironment<Value, ID: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value?>,
    id: @escaping (Value?) -> ID,
    to binding: Binding<Value?>,
  ) -> some View {
    modifier(EnvironmentSyncModifier(keyPath, id: id, action: { binding.wrappedValue = $0 }))
  }

  // MARK: - Action-Based Observation (Non-Optional)

  /// Observe an environment value and perform an action when it changes.
  ///
  /// Calls `apply` with the current value at `keyPath` as the view appears and whenever the
  /// value changes.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - perform: A closure invoked with the latest value.
  ///
  /// - Example:
  /// ```swift
  /// .syncEnvironment(\.scenePhase) { phase in
  ///   print("Scene phase changed to: \(phase)")
  /// }
  /// ```
  public func onEnvironmentChange<Value: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value>,
    perform action: @escaping (Value) -> Void,
  ) -> some View {
    modifier(EnvironmentSyncModifier(keyPath, id: { $0 }, action: action))
  }

  /// Observe an environment value and perform an action using a custom identity.
  ///
  /// Uses the supplied `id` closure to determine when the value has meaningfully changed.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - id: A closure that computes an `Equatable` identity from the current value.
  ///   - apply: A closure invoked with the latest value.
  ///
  /// - Example:
  /// ```swift
  /// .syncEnvironment(\.myEnv, id: \.token) { env in
  ///   // Only called when token changes
  /// }
  /// ```
  public func onEnvironmentChange<Value, ID: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value>,
    id: @escaping (Value) -> ID,
    perform action: @escaping (Value) -> Void,
  ) -> some View {
    modifier(EnvironmentSyncModifier(keyPath, id: id, action: action))
  }

  // MARK: - Action-Based Observation (Optional)

  /// Observe an optional environment value and perform an action when it changes.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - apply: A closure invoked with the latest value.
  public func onEnvironmentChange<Value: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value?>,
    perform action: @escaping (Value?) -> Void,
  ) -> some View {
    modifier(EnvironmentSyncModifier(keyPath, id: { $0 }, action: action))
  }

  /// Observe an optional environment value and perform an action using a custom identity.
  ///
  /// - Parameters:
  ///   - keyPath: The environment key path to observe.
  ///   - id: A closure that computes an `Equatable` identity from the current value.
  ///   - apply: A closure invoked with the latest value.
  ///
  /// - Example:
  /// ```swift
  /// .syncEnvironment(\.myEnv, id: { $0?.token }) { env in
  ///   // Only called when token changes
  /// }
  /// ```
  public func onEnvironmentChange<Value, ID: Equatable>(
    _ keyPath: KeyPath<EnvironmentValues, Value?>,
    id: @escaping (Value?) -> ID,
    perform action: @escaping (Value?) -> Void,
  ) -> some View {
    modifier(EnvironmentSyncModifier(keyPath, id: id, action: action))
  }

}

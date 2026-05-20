//
//  Binding.swift
//  Collection
//
//  Created by Dave Coleman on 1/11/2024.
//

import SwiftUI

extension Binding where Value == Int {
  /// Convert `Int` Binding to `Double` Binding
  public var toBindingDouble: Binding<Double> {
    Binding<Double>(
      get: { Double(wrappedValue) },
      set: { wrappedValue = Value($0) }
    )
  }
  /// Convert `Int` Binding to `Double` Binding
  public var toBindingCGFloat: Binding<CGFloat> {
    Binding<CGFloat>(
      get: { CGFloat(wrappedValue) },
      set: { wrappedValue = Value($0) }
    )
  }

  /// Convert `Int` Binding to `Double` Binding
  public func toBindingBinaryFloatingPoint<T: BinaryFloatingPoint & Sendable>() -> Binding<T> {
    Binding<T>(
      get: { T(wrappedValue) },
      set: { wrappedValue = Value($0) }
    )
  }
}

extension Binding where Value: Sendable {
  public var toOptionalBinding: Binding<Value?> {
    Binding<Value?>(
      get: { wrappedValue },
      set: {
        guard let value = $0 else { return }
        wrappedValue = value
      }
    )
  }
}

extension Binding where Value: BinaryFloatingPoint & Sendable {
  public var toBindingCGFloat: Binding<CGFloat> {
    Binding<CGFloat>(
      get: { CGFloat(wrappedValue) },
      set: { wrappedValue = Value($0) }
    )
  }
  public var toBindingDouble: Binding<Double> {
    Binding<Double>(
      get: { Double(wrappedValue) },
      set: { wrappedValue = Value($0) }
    )
  }

}
extension Binding where Value == ClosedRange<Int> {
  public func toBindingBinaryFloatingPoint<T: BinaryFloatingPoint & Sendable>() -> Binding<ClosedRange<T>> {
    Binding<ClosedRange<T>>(
      get: { wrappedValue.toBinaryFloatingPointRange() },
      set: { wrappedValue = $0.toIntRange }
    )
  }
}
extension Binding where Value == Bool {
  public var reversed: Binding<Bool> {
    return .init(
      get: { !self.wrappedValue },
      set: { self.wrappedValue = !$0 }
    )
  }
}

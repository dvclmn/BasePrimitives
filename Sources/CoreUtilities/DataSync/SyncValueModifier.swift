//
//  SyncValueModifier.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 10/5/2026.
//

import SwiftUI

struct SyncValueModifier<Value: Equatable>: ViewModifier {

  let value: Value
  let binding: Binding<Value>?
  //  let didDisappear: () -> Void

  func body(content: Content) -> some View {
    content
      .task(id: value) {
        guard binding?.wrappedValue != value else { return }
        binding?.wrappedValue = value
      }
    //      .onDisappear {
    //        externalCoordinateSpaceMapper?.wrappedValue = nil
    //      }
  }
}

extension View {
  public func syncValue<Value: Equatable>(
    _ value: Value,
    to binding: Binding<Value>?,
    //    didDisappear: @escaping () -> Void
  ) -> some View {
    modifier(
      SyncValueModifier(
        value: value,
        binding: binding,
        //        didDisappear: ,
      )
    )
  }
}

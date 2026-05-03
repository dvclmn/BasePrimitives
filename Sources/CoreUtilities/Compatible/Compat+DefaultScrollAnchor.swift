//
//  Compat+DefaultScrollAnchor.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 2/5/2026.
//

import SwiftUI

extension View {
  @ViewBuilder
  public func defaultScrollAnchorCompatible(
    _ anchor: UnitPoint?,
    for role: ScrollAnchorRoleCompatible = .initialOffset,
  ) -> some View {
    if #available(macOS 15, iOS 17, *) {
      defaultScrollAnchor(anchor, for: role.toNativeRole)
    } else {
      self
    }
  }
}

public enum ScrollAnchorRoleCompatible: Hashable {
  case initialOffset
  case sizeChanges
  case alignment
}

@available(macOS 15, iOS 17, *)
extension ScrollAnchorRoleCompatible {
  public var toNativeRole: ScrollAnchorRole {
    switch self {
      case .initialOffset: .initialOffset
      case .sizeChanges: .sizeChanges
      case .alignment: .alignment
    }
  }
}

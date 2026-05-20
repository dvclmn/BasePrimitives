//
//  MoveCommandDirection.swift
//  Collection
//
//  Created by Dave Coleman on 27/12/2024.
//

import SwiftUI

extension MoveCommandDirection {

  public var displayName: String {
    switch self {
      case .up: "Up"
      case .down: "Down"
      case .left: "Left"
      case .right: "Right"
      @unknown default: "Unknown"
    }
  }

  @available(*, deprecated, renamed: "displayName")
  public var name: String { displayName }
}

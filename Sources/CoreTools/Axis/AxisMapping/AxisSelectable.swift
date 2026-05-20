//
//  AxisSelectable.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 22/2/2026.
//

import SwiftUI

// MARK: - Helper extensions for SwiftUI

/// Useful for e.g. `Edge` and `Alignment`, which don't store values,
/// but rather represent directions.
public protocol AxisOrientable {
  /// Returns the equivalent value under a different axis mapping.
  func mapped(by mapping: AxisMapping) -> Self
}

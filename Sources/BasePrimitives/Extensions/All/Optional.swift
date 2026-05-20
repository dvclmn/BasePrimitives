//
//  Optional.swift
//  Helpers
//
//  Created by Dave Coleman on 31/8/2024.
//

import SwiftUI

extension Optional where Wrapped: BinaryFloatingPoint {
  public var toCGFloatIfPresent: CGFloat? {
    map { CGFloat($0) }
  }
  public var toDoubleIfPresent: Double? {
    map { Double($0) }
  }
}

extension Optional where Wrapped == Bool {
  public var _boundBool: Bool? {
    get { self }
    set { self = newValue }
  }
  
  public func boundBool(_ fallback: Bool = false) -> Bool {
    _boundBool ?? fallback
  }
}

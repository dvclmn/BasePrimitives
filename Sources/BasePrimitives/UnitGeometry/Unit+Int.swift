//
//  Unit+Extensions.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 27/2/2026.
//

import Foundation

extension Int {

  public func toScreenLength(
    using unitLength: CGFloat?,
    policy: ConversionSafetyPolicy = .checkOnly,
  ) -> CGFloat? {
    guard let unitLength else { return nil }
    switch policy {
      case .checkOnly:
        guard isSafeToConvert(self, using: unitLength) else { return nil }

      case .assertDebug:
        assertSafeToConvert(self, using: unitLength)
        guard isSafeToConvert(self, using: unitLength) else { return nil }

      case .enforceRuntime:
        preconditionSafeToConvert(self, using: unitLength)
        guard isSafeToConvert(self, using: unitLength) else { return nil }

    }
    return CGFloat(self) * unitLength
  }

  public func toScreenLength(
    along axis: GeometryAxis,
    mapping: AxisMapping = .default,
    using unitSize: CGSize?,
    policy: ConversionSafetyPolicy = .checkOnly,
  ) -> CGFloat? {
    guard let unitSize else { return nil }
    let length = unitSize.value(along: axis, mapping: mapping)
    return toScreenLength(using: length, policy: policy)
  }

}

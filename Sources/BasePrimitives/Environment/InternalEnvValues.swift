//
//  InternalEnvValues.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 7/4/2026.
//

import SwiftUI

extension EnvironmentValues {
  
  /// This is generally exposed to
  @Entry @_spi(Internals) public var areaOutline: AreaOutline = .init()
}

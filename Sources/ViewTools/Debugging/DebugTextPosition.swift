//
//  DebugCanvas.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 8/10/2025.
//

import SwiftUI

public enum DebugTextPosition {
  case aboveOrigin
  case belowOrigin
  
  public var multiplierForYPosition: CGFloat {
    switch self {
      case .aboveOrigin: 1
      case .belowOrigin: -1
    }
  }
}


//public enum DebugPoint: Sendable {
//  case none
//  case point(Color)
//
//  public static let `default`: Self = .point(.orange)
//
//  public var colourForPoint: Color? {
//    switch self {
//      case .point(let colour): colour
//      case .none: nil
//    }
//  }
//}
//

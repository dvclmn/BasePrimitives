//
//  UnitPoint+Conversions.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 15/3/2026.
//

import SwiftUI

extension UnitPoint {

  public var opposing: UnitPoint {
    switch self {
      case .top: .bottom
      case .bottom: .top
      case .leading: .trailing
      case .trailing: .leading
      case .topLeading: .bottomTrailing
      case .topTrailing: .bottomLeading
      case .bottomLeading: .topTrailing
      case .bottomTrailing: .topLeading
      default: .center
    }
  }

  public var toAlignment: Alignment {
    switch self {
      case .top: .top
      case .bottom: .bottom
      case .leading: .leading
      case .trailing: .trailing
      case .topLeading: .topLeading
      case .topTrailing: .topTrailing
      case .bottomLeading: .bottomLeading
      case .bottomTrailing: .bottomTrailing
      default: .center
    }
  }
}

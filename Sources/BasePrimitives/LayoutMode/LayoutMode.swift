//
//  LayoutMode.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 8/10/2025.
//

import SwiftUI

public enum LayoutMode: String, CaseCyclable, CaseTogglable, Codable, Sendable {
  public static var defaultCase: LayoutMode { .list }

  case grid
  case list

  public var label: QuickLabel {
    QuickLabel(rawValue.capitalized, symbol: iconString)
  }

  public var iconString: String {
    switch self {
      case .grid: "circle.grid.2x2"
      case .list: "checklist.unchecked"
    }
  }
  
  public var isGrid: Bool {
    if case .grid = self {
      return true
    }
    return false
  }
  
  public var isList: Bool {
    if case .list = self {
      return true
    }
    return false
  }
}

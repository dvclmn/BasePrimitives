//
//  Alignment.swift
//  Collection
//
//  Created by Dave Coleman on 20/12/2024.
//

import SwiftUI
import CoreTools

/// Good to remember: `Alignment` always describes
/// *two* things; a `HorizontalAlignment` *and*
/// a `VerticalAlignment`. It is not one or the other,
/// it is a composite of both.
extension Alignment {

  public var toTextAlignment: TextAlignment {
    switch self {
      case .topLeading, .bottomLeading, .leading: .leading
      case .topTrailing, .bottomTrailing, .trailing: .trailing
      case .center: .center
      default: .leading
    }
  }

  public var toOpposing: Alignment {
    switch self {

      case .topLeading: .bottomTrailing
      case .top: .bottom
      case .topTrailing: .bottomLeading
      case .leading: .trailing
      case .center: .center
      case .trailing: .leading
      case .bottomLeading: .topTrailing
      case .bottom: .top
      case .bottomTrailing: .topLeading

      /// Text baseline variants map by flipping vertical while keeping horizontal mirrored
      case .leadingFirstTextBaseline: .trailingLastTextBaseline
      case .centerFirstTextBaseline: .centerLastTextBaseline
      case .trailingFirstTextBaseline: .leadingLastTextBaseline
      case .leadingLastTextBaseline: .trailingFirstTextBaseline
      case .centerLastTextBaseline: .centerFirstTextBaseline
      case .trailingLastTextBaseline: .leadingFirstTextBaseline

      default: .center
    }
  }
}

extension HorizontalAlignment {
  public var displayName: String {
    switch self {
      case .leading: "Leading"
      case .center: "Center"
      case .trailing: "Trailing"
      case .listRowSeparatorLeading: "List Row Separator Leading"
      case .listRowSeparatorTrailing: "List Row Separator Trailing"

      default: "Unknown"
    }
  }

}
extension VerticalAlignment {
  public var displayName: String {
    switch self {
      case .bottom: "Bottom"
      case .center: "Center"
      case .top: "Top"
      case .firstTextBaseline: "First Text Baseline"
      case .lastTextBaseline: "Last Text Baseline"
      default: "Unknown"
    }
  }
  /// Returns `.center` as default if case is unknown
  public var opposite: VerticalAlignment {
    switch self {
      case .top: .bottom
      case .bottom: .top
      case .firstTextBaseline: .lastTextBaseline
      case .lastTextBaseline: .firstTextBaseline
      default: .center
    }
  }

  //  public var toTextAlignment: TextAlignment {
  //    switch self {
  //      case .leading: .leading
  //      case .center: .center
  //      case .bottom: .trailing
  //      default: .leading
  //    }
  //  }
}

extension HorizontalAlignment {
  /// Maps a horizontal alignment to its vertical equivalent.
  var verticalEquivalent: VerticalAlignment {
    switch self {
      case .leading: return .top
      case .trailing: return .bottom
      default: return .center
    }
  }
}

extension VerticalAlignment {
  /// Maps a vertical alignment to its horizontal equivalent.
  var horizontalEquivalent: HorizontalAlignment {
    switch self {
      case .top: return .leading
      case .bottom: return .trailing
      default: return .center
    }
  }
}

/// ```
/// let layoutMapping: AxisMapping = .transposed
/// let baseAlignment: Alignment = .topLeading // (H: .leading, V: .top)
///
/// let resolved = baseAlignment.mapped(by: layoutMapping)
/// // Result: .topLeading
/// // Because:
/// // Old H (.leading) -> New V (.top)
/// // Old V (.top) -> New H (.leading)
/// // In a transpose, .topLeading stays .topLeading visually!
///
/// let topTrailing: Alignment = .topTrailing // (H: .trailing, V: .top)
/// let resolvedTrailing = topTrailing.mapped(by: layoutMapping)
/// // Result: .bottomLeading
/// // Old H (.trailing) -> New V (.bottom)
/// // Old V (.top) -> New H (.leading)
/// ```
extension Alignment: AxisOrientable {
  public func mapped(by mapping: AxisMapping) -> Alignment {
    /// If identity, return as-is.
    guard mapping == .transposed else { return self }
    
    /// Swap and Translate:
    /// 1. The old Horizontal becomes the new Vertical equivalent.
    /// 2. The old Vertical becomes the new Horizontal equivalent.
    return Alignment(
      horizontal: self.vertical.horizontalEquivalent,
      vertical: self.horizontal.verticalEquivalent
    )
  }
}

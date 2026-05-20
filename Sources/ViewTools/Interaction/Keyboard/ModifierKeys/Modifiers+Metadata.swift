//
//  Modifiers+Metadata.swift
//  InteractionKit
//
//  Created by Dave Coleman on 3/4/2026.
//

import Foundation

extension Modifiers {

  struct Metadata: Hashable {
    let name: String
    let symbol: String
  }

  /// Canonical ordering for display purposes
  private static let displayOrder: [Modifiers] = [
    .control, .option, .shift, .command, .capsLock, .numericPad
  ]

  /// Metadata for each known modifier
  private static let metadata: [Modifiers: Modifiers.Metadata] = [
    .shift: .init(name: "Shift", symbol: "􀆝"),
    .control: .init(name: "Control", symbol: "􀆍"),
    .option: .init(name: "Option", symbol: "􀆕"),
    .command: .init(name: "Command", symbol: "􀆔"),
    .capsLock: .init(name: "Caps Lock", symbol: "􀆡"),
    .numericPad: .init(name: "Numeric Pad", symbol: "􀅱"),
  ]

  /// Default display string uses symbols, e.g. "[􀆕, 􀆔]"
  public var displayString: String {
    displayString(using: .icon)
  }

  /// Build a display string using the requested elements (name, icon, or both).
  /// - Parameter elements: Which elements to include for each modifier.
  /// - Returns: A string like "[Option, Command]", "[􀆕, 􀆔]", or
  ///   "[Option 􀆕, Command 􀆔]".
  public func displayString(using elements: ModifierDisplayElements) -> String {
    /// Build parts in canonical order for stable output
    var parts: [String] = []

    for key in Self.displayOrder where self.contains(key) {
      guard let meta = Self.metadata[key] else { continue }

      switch elements {
      case .name:
        parts.append(meta.name)
      case .icon:
        parts.append(meta.symbol)
      case .both:
        parts.append("\(meta.name) \(meta.symbol)")
      default:
        /// Fallback to icon if an unknown combination is provided
        parts.append(meta.symbol)
      }
    }

    return "[" + parts.joined(separator: ", ") + "]"
  }
}

extension Modifiers: CustomStringConvertible {
  public var description: String { displayString }
}

public struct ModifierDisplayElements: OptionSet, Sendable {
  public init(rawValue: Int) {
    self.rawValue = rawValue
  }
  public let rawValue: Int

  public static let name = Self(rawValue: 1 << 0)
  public static let icon = Self(rawValue: 1 << 1)
  public static let both: Self = [.name, .icon]
}

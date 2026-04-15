//
//  DisplayBlock.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 6/10/2025.
//

import AppKit
import Foundation

/// Akin to a document AST node. Each block knows how to render itself
/// given a float format and a label style.
public enum DisplayBlock: Sendable {
  case text(DisplayFragment)
  case labeled(Labeled)
  case indented(Indented)
  case divider(Divider)
}

extension DisplayBlock {

  /// `labelStyle` is the layer-4 concern: how a top-level block label is displayed.
  /// Default is `.standard`; callers (e.g. `DisplayString`) can override.
  public func render(
    using format: FloatDisplayFormat,
    with labelStyle: AbbreviableLabel.Style,
    delimiter: String = ", ",
    //    labelStyle: AbbreviableLabel.Style = .standard,
    //    using format: FloatDisplayFormat
  ) -> String {
    let string: String? =
      switch self {
        case .text(let fragment):
          fragment.render(using: format, with: labelStyle, delimiter: delimiter)

        case .labeled(let label):
          label.toString(using: format, with: labelStyle)

        case .divider(let text):
          text.value

        case .indented(let indented):
          indented.render(using: format, with: labelStyle)
      }

    return string ?? ""
  }
}

//extension DisplayBlock {
//  var indentationDepth: Int {
//    switch self {
//      case .indented(let indented):
//        1 + (indented.content.map(\.indentationDepth).max() ?? 0)
//      default: 0
//    }
//  }
//}

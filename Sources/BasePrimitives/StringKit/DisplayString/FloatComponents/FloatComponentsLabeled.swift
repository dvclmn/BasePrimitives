//
//  LabeledComponent.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 12/10/2025.
//

import Foundation

/// A type with multiple named float properties.
/// E.g. `CGPoint` (x, y) or `CGSize` (width, height).
///
/// Responsibility: join its `[Labeled]` components with a `ComponentSeparator`.
/// It does not own block-level separator logic — that lives at the
/// `DisplayBlock`/`DisplayString` layer.
public protocol FloatComponentsLabeled: DisplayPresetRenderable {
//public protocol FloatComponentsLabeled: DisplayFragmentRenderable, DisplayPresetRenderable {

  /// The ordered label+value components.
  /// E.g. `[("W", 260), ("H", 410)]` for a `CGSize`.
  var components: [Labeled] { get }

  func renderComponents(
    labelStyle: AbbreviableLabel.Style,
    using format: FloatDisplayFormat,
    delimiter: String,
  ) -> String
}

extension FloatComponentsLabeled {

  /// Convenience: render with a preset (uses `.standard` label style).
  public func displayString(_ preset: FloatDisplayPreset) -> String {
    renderComponents(labelStyle: .standard, using: preset.format)
  }

  /// `DisplayFragmentRenderable` conformance — renders with default label style.
  public func render(using format: FloatDisplayFormat) -> String {
    renderComponents(labelStyle: .standard, using: format)
  }
}

extension FloatComponentsLabeled {

  public func renderComponents(
    labelStyle: AbbreviableLabel.Style = .standard,
    using format: FloatDisplayFormat = .default,
    delimiter: String = ", ",
  ) -> String {
    components
      .map { $0.toString(labelStyle: labelStyle, using: format) }
      .joined(delimiter)
  }
}

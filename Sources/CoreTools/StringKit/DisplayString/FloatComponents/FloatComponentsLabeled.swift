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
///
/// Conforms to `DisplayFragmentRenderable` to participate in the DisplayString Builder
//public protocol FloatComponentsLabeled: DisplayPresetRenderable {
public protocol FloatComponentsLabeled: DisplayFragmentRenderable, DisplayPresetRenderable {

  /// The ordered label+value components.
  /// E.g. `[("W", 260), ("H", 410)]` for a `CGSize`.
  var components: [Labeled] { get }

  func render(
    using format: FloatDisplayFormat,
    with labelStyle: AbbreviableLabel.Style,
    delimiter: String,
  ) -> String
}

extension FloatComponentsLabeled {

  /// Convenience: render with a preset (uses `.standard` label style).
  public func displayString(_ preset: FloatDisplayPreset) -> String {
    render(
      using: preset.format,
      with: .standard,
    )
  }

  /// `DisplayFragmentRenderable` conformance — renders with default label style.
//  public func render(using format: FloatDisplayFormat) -> String {
//    renderComponents(labelStyle: .standard, using: format)
//  }
}

extension FloatComponentsLabeled {

  public func render(
    using format: FloatDisplayFormat = .default,
    with labelStyle: AbbreviableLabel.Style = .standard,
    delimiter: String = ", ",
  ) -> String {
    components
      .map { $0.toString(using: format, with: labelStyle) }
      .joined(delimiter)
  }
}

//
//  Model+Labeled.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 4/10/2025.
//

import AppKit

/// A label+value pair. Used both as a standalone `DisplayBlock` (e.g. `"Dimensions: 260 x 410"`)
/// and as an individual component inside `FloatComponentsLabeled` (e.g. `"W 260"`).
///
/// Separator ownership:
/// - The separator between this label and its value (`separator`, default `" "`) lives here.
/// - The separator between a top-level block label and its content (e.g. `": "`) is supplied
///   by the `DisplayBlock` rendering layer.
/// - The delimiter between sibling components (e.g. `" x "`) lives on `FloatComponentsLabeled`.
public struct Labeled: Sendable {

  public let key: AbbreviableLabel
  public let value: DisplayFragment?

  /// Separator between the label text and the value,
  /// e.g. the space in `W 260`. Defaults to `" "`.
  public let separator: String

  /// Per-item float format override. Inherits from context when `nil`.
  public let formatOverride: FloatDisplayFormat?
  public var styleOverride: AbbreviableLabel.Style?

  init(
    key: AbbreviableLabel,
    value: DisplayFragment?,
    separator: String = ": ",
    formatOverride: FloatDisplayFormat? = nil,
    styleOverride: AbbreviableLabel.Style? = nil,
  ) {
    self.key = key
    self.separator = separator
    self.value = value
    self.formatOverride = formatOverride
    self.styleOverride = styleOverride
  }
}

// MARK: - Convenience initialisers

extension Labeled {

  /// General-purpose init: key string + any value.
  public init(
    _ key: String,
    value: Any?,
    separator: String = ": ",
    format: FloatDisplayFormat? = nil,
  ) {
    self.init(
      key: AbbreviableLabel(key),
      value: DisplayFragment.make(from: value),
      separator: separator,
      formatOverride: format,
    )
  }

  /// Convenience for Collection types
  public init<C: Collection>(
    _ key: String,
    data: C,
    maxItems: Int? = nil,
    showCount: Bool = true,
    separator: String = ": ",
  ) {
    self.init(
      key: AbbreviableLabel(key),
      value: .make(from: data),
      separator: separator,
    )
  }
}

// MARK: - Rendering

/// Allows exposure to BaseHelpers, for InfoBar, without leaking to user-facing API
@_spi(Internals) extension Labeled {

  /// Renders the label text only (no value or separator).
  /// Have removed the option to pass in a label style for this,
  /// as these methods are for a display context, not for use
  /// as the building block for `FloatComponentsLabeled`
  public func labelPart() -> String? {
    //  public func labelPart(with style: AbbreviableLabel.Style) -> String? {
    key.labelText(with: .standard)
  }

  /// Renders the value only.
  public static func valuePart(
    for label: Self,
    using format: FloatDisplayFormat,
    with labelStyle: AbbreviableLabel.Style,
    delimiter: String = ", ",
  ) -> String? {
    return label.value?.render(
      using: format,
      with: labelStyle,
      delimiter: delimiter,
    )
  }

}

extension Labeled {

  /// Renders `"<label><separator><value>"`, e.g. `"W 260"`.
  /// Pass `.none` for `labelStyle` to suppress the label entirely.
  /// Returns `nil` if all parts are absent.
  package func toString(
    using format: FloatDisplayFormat = .default,
    with labelStyle: AbbreviableLabel.Style = .standard,
  ) -> String {
    let effectiveFormat = formatOverride ?? format
    let effectiveStyle = styleOverride ?? labelStyle

    let label: String? = labelPart()
    let sep: String? = label != nil ? separator.toString : nil
    let value: String? = Self.valuePart(
      for: self,
      using: effectiveFormat,
      with: effectiveStyle,
    )

    let result = [label, sep, value].compactMap { $0 }.joined()
    return result
  }
}

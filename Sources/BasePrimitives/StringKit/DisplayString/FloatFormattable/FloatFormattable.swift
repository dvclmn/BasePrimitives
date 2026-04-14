//
//  DisplayString.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 4/7/2025.
//

import SwiftUI

//public protocol FloatFormattable: BinaryFloatingPoint, DisplayPresetRenderable {
public protocol FloatFormattable: BinaryFloatingPoint, DisplayFragmentRenderable, DisplayPresetRenderable {
  func render(using format: FloatDisplayFormat) -> String
}

public typealias NumberGrouping = FloatingPointFormatStyle<Double>.Configuration.Grouping

extension FloatFormattable {
  public func displayString(_ preset: FloatDisplayPreset) -> String {
    render(using: preset.format)
  }

  /// Conformance to `DisplayFragmentRenderable`
  public func render(
    using format: FloatDisplayFormat,
    with labelStyle: AbbreviableLabel.Style,
    delimiter: String,
  ) -> String {
    render(using: format)
  }
}

/// This protocol combo is unlikely to exist, but just in case
//extension FloatFormattable where Self: FloatComponentsLabeled {
//  public var displayString: String {
//    renderProperties(using: .default)
//  }
//  public func displayString(_ preset: FloatDisplayPreset) -> String {
//    renderProperties(using: preset.format)
//  }
//}

extension Double: FloatFormattable {}
extension CGFloat: FloatFormattable {}
extension Float: FloatFormattable {}

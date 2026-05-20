//
//  LabeledModifiers.swift
//  ToolKit
//
//  Created by Dave Coleman on 14/4/2026.
//

extension Labeled {
  /// This label style applies to any Labeled items in the `value`,
  /// not to the label style of `Self`
  public func labelStyle(
    _ style: AbbreviableLabel.Style
  ) -> Self {
    var result = self
    result.styleOverride = style
    return result
  }
}

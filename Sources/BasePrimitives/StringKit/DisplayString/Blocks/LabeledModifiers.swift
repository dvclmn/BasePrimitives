//
//  LabeledModifiers.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 14/4/2026.
//

extension Labeled {
  public func labelStyle(
    _ style: AbbreviableLabel.Style
  ) -> Self {
    var result = self
    result.styleOverride = style
    return result
  }
}

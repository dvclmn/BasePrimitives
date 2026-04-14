//
//  DisplayElement.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 23/2/2026.
//

/// This exists to
public protocol DisplayFragmentRenderable: Sendable {
  func render(
    format: FloatDisplayFormat,
    labelStyle: AbbreviableLabel.Style,
  ) -> String
}

//extension String: DisplayFragmentRenderable {
//  public func render(using format: FloatDisplayFormat) -> String { self }
//}

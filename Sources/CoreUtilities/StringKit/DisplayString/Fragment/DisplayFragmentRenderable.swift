//
//  DisplayElement.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 23/2/2026.
//

/// This exists to
public protocol DisplayFragmentRenderable: Sendable {
  func render(
    using format: FloatDisplayFormat,
    with labelStyle: AbbreviableLabel.Style,
    delimiter: String,
  ) -> String
}

extension String: DisplayFragmentRenderable {
  /// This is a passthrough, does nothing. Could probably be modelled better
  public func render(
    using format: FloatDisplayFormat,
    with labelStyle: AbbreviableLabel.Style,
    delimiter: String,
  ) -> String { self }
}



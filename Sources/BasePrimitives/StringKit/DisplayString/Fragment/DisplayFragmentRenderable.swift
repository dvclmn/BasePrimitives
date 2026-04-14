//
//  DisplayElement.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 23/2/2026.
//

public protocol DisplayFragmentRenderable: Sendable {
  func render(using format: FloatDisplayFormat) -> String
}

extension String: DisplayFragmentRenderable {
  public func render(using format: FloatDisplayFormat) -> String { self }
}

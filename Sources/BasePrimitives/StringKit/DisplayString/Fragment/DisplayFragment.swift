//
//  DisplayFragment.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 14/4/2026.
//

/// IIRC, there was an issue with holding an `any `
/// Type-erased box
public struct DisplayFragment: Sendable {
  private let _render: @Sendable (FloatDisplayFormat) -> String

  public init<R: DisplayFragmentRenderable>(_ base: R) {
    self._render = { format in base.render(using: format) }
  }

  public func render(using format: FloatDisplayFormat) -> String {
    _render(format)
  }
}

/// `DisplayBlock(from: Any?)` can just become `.text(.make(from: value))`
/// `Labeled.init(key:value:Any?)` can become `DisplayFragment.make(from:)`
extension DisplayFragment {
  public static func make(from value: Any?) -> DisplayFragment {
    switch value {
      case let result as DisplayFragmentRenderable:
        return DisplayFragment(result)

      case let val as CustomStringConvertible:
        return DisplayFragment(val.description)

      default:
        return DisplayFragment(String(describing: value))
    }
  }
}

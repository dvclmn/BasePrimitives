//
//  DisplayFragment.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 14/4/2026.
//

/// IIRC, there was an issue with holding an `any `
/// Type-erased box
public struct DisplayFragment: Sendable {
  private let _render: @Sendable (FloatDisplayFormat, AbbreviableLabel.Style, String) -> String

  //  public init(from string: String) {
  //    //  public init<R: DisplayFragmentRenderable>(_ base: R) {
  //    self._render = { _, _ in
  ////      base.render(using: format, with: style)
  //      string
  //    }
  //  }

  //  public init<T: FloatComponentsLabeled>(_ base: T) {
  public init<R: DisplayFragmentRenderable>(_ base: R) {
    self._render = { format, style, delimiter in
      base.render(using: format, with: style, delimiter: delimiter)
    }
  }

  public func render(
    using format: FloatDisplayFormat,
    with labelStyle: AbbreviableLabel.Style,
    delimiter: String,
  ) -> String {
    _render(format, labelStyle, delimiter)
  }
}

/// `DisplayBlock(from: Any?)` can just become `.text(.make(from: value))`
/// `Labeled.init(key:value:Any?)` can become `DisplayFragment.make(from:)`
extension DisplayFragment {
  public static func make(from value: Any?) -> DisplayFragment {
    switch value {
      case let result as FloatComponentsLabeled:
        //      case let result as DisplayFragmentRenderable:
        return DisplayFragment(result)

      case let val as CustomStringConvertible:
        return DisplayFragment(val.description)

      default:
        return DisplayFragment(String(describing: value))
    }
  }
}

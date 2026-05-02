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
      case let val as FloatComponentsLabeled:
        //      case let result as DisplayFragmentRenderable:
        return DisplayFragment(val)

      case let val as [CustomStringConvertible]:
        let values = val.enumerated().map { index, item in
          "  " + item.description.replacingOccurrences(of: "\n", with: "\n  ")
          //          if index > 0 {
          //            item.description.replacingOccurrences(of: "\n", with: "\n  ")
          //          } else {
          //            item.description
          //          }

        }.joined(",\n\n")

        let joined = """
          [
          \(values)
          ]
          """

        //        let joined = val.map(\.description).joined(separator: ",\n\n")
        return DisplayFragment("\n" + joined)

      case let val as CustomStringConvertible:
        return DisplayFragment(val.description)

      //      case let val = T as Collection where T.Element: CustomStringConvertible:

      //        return DisplayFragment

      default: return DisplayFragment(String(describing: value))
    }
  }
}

//
//  Model+Indented.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 4/10/2025.
//

import Foundation

public struct Indented: Sendable {
  public let title: String?
  public let content: [DisplayBlock]
}

extension Indented {
  public init(
    _ title: String? = nil,
    @DisplayStringBuilder content: () -> [DisplayBlock],
  ) {
    self.title = title
    self.content = content()
  }

  init(fromLines indentedLines: IndentedLines) {
    let blocks: [DisplayBlock] = indentedLines.lines.map {
      DisplayBlock.text(DisplayFragment($0))
    }
    self.init(title: indentedLines.title, content: blocks)
  }

  public func render(
    using format: FloatDisplayFormat,
    with labelStyle: AbbreviableLabel.Style = .standard,
  ) -> String {

    let blocks =
      content.isEmpty
      ? ["(No items)"]
      : content.map {
        $0.render(using: format, with: labelStyle)
      }

    let elements = indentedElements(content: blocks)

    let result = elements.reduce(into: "") { partial, item in
      partial += "\n" + item
    }

    let effectiveTitle = title ?? ""

    //    guard !content.isEmpty else {
    //      return effectiveTitle + " (no content)"
    //    }
    return effectiveTitle + result + "\n"

  }

  private func indentedElements(
    content: [String],
    indent: String = "  ",
    isLastElement: Bool = false,
  ) -> [String] {
    var builder = IndentedLineBuilder(indent: indent)
    return builder.build(from: content)
  }
}

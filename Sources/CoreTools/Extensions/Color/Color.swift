//
//  File.swift
//
//
//  Created by Dave Coleman on 23/7/2024.
//

import SwiftUI

extension Color {
  public var toShapeStyle: AnyShapeStyle { AnyShapeStyle(self) }
}

extension Color {
  
  public static let darkGrey: Color = .init(white: 0.28)
  public static let darkerGrey: Color = .init(white: 0.1)
  
  public func toCGColor(using environment: EnvironmentValues) -> CGColor{
    resolve(in: environment).cgColor
  }

  public static var random: Color { self.random() }

  public static func random(randomOpacity: Bool = false) -> Color {
    Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1),
      opacity: randomOpacity ? .random(in: 0...1) : 1
    )
  }
  public var toNSColor: NSColor { NSColor(self) }
}

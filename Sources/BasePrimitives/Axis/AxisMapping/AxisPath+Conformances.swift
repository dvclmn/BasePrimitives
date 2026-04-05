//
//  Adjustable+Conformances.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 6/1/2026.
//

import SwiftUI

extension CGSize: AxisKeyPathWritable {
  public static var primaryWritableKey: WritableKeyPath<Self, CGFloat> { \.width }
  public static var secondaryWritableKey: WritableKeyPath<Self, CGFloat> { \.height }
}

extension CGRect: AxisKeyPathWritable {
  public static var primaryWritableKey: WritableKeyPath<Self, CGFloat> { \.size.width }
  public static var secondaryWritableKey: WritableKeyPath<Self, CGFloat> { \.size.height }
}

extension CGPoint: AxisKeyPathWritable {
  public static var primaryWritableKey: WritableKeyPath<Self, CGFloat> { \.x }
  public static var secondaryWritableKey: WritableKeyPath<Self, CGFloat> { \.y }
}
extension CGVector: AxisKeyPathWritable {
  public static var primaryWritableKey: WritableKeyPath<Self, CGFloat> { \.dx }
  public static var secondaryWritableKey: WritableKeyPath<Self, CGFloat> { \.dy }
}

extension UnitPoint: AxisKeyPathWritable {
  public static var primaryWritableKey: WritableKeyPath<Self, CGFloat> { \.x }
  public static var secondaryWritableKey: WritableKeyPath<Self, CGFloat> { \.y }
}

extension EdgeInsets: AxisKeyPathWritable {
  public static var primaryWritableKey: WritableKeyPath<Self, CGFloat> { \.horizontalUniform }
  public static var secondaryWritableKey: WritableKeyPath<Self, CGFloat> { \.verticalUniform }
}

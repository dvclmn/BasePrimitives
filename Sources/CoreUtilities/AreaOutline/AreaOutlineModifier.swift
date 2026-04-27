//
//  AreaOutlineModifier.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 5/4/2026.
//

//import SwiftUI

//struct AreaOutlineModifier: ViewModifier {
////  @Environment(\.self) private var env
////  @Environment(\.zoomLevel) private var zoomLevel
////  @Environment(\.zoomRange) private var zoomRange
//
//  let colour: Color
//  let rounding: Double
//  let lineWidth: Double
//  let sensitivity: Double?
////  let outline: AreaOutline
//
//  func body(content: Content) -> some View {
//    content
//      .overlay {
//        RoundedRectangle(
//          cornerRadius: rounding.removingZoom(
//            zoomLevel,
//            across: zoomRange,
//            sensitivity: sensitivity,
//          )
//        )
//        .fill(.clear)
//        .stroke(
//          colour,
//          lineWidth: lineWidth.removingZoom(
//            zoomLevel,
//            across: zoomRange,
//            sensitivity: sensitivity,
//          ),
//        )
//        .allowsHitTesting(false)
//      }
////      .overlay { AreaOutlineShape(outline) }
//  }
//}

//extension View {
//  public func areaOutline(
//    colour: Color = .white.opacity(0.07),
//    rounding: Double = 4,
//    lineWidth: Double = 1,
//  ) -> some View {
//    self.modifier(
//      AreaOutlineModifier(
//        colour: colour,
//        rounding: rounding,
//        lineWidth: lineWidth,
//        sensitivity: nil
////        outline: .init(
////          colour: colour,
////          rounding: rounding,
////          lineWidth: lineWidth,
////        )
//      )
//    )
//  }
//}

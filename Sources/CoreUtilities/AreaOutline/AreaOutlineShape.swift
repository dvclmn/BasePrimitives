//
//  AreaOutlineShape.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 7/4/2026.
//

//import SwiftUI
//
////struct AreaOutlineShape: View {
//  //  @Environment(\.self) private var env
//  @Environment(\.zoomLevel) private var zoomLevel
//  @Environment(\.zoomRange) private var zoomRange
//
//  let colour: Color
//  let rounding: Double
//  let lineWidth: Double
//  let sensitivity: Double
  //  let outline: AreaOutline

  //  public init(_ outline: AreaOutline) {
  //    self.outline = outline
  //  }

  //  public init(
  //    colour: Color = .white.opacity(0.07),
  //    rounding: Double = 4,
  //    lineWidth: Double = 1,
  //  ) {
  //    self.init(
  //      AreaOutline(
  //        colour: colour,
  //        rounding: rounding,
  //        lineWidth: lineWidth,
  //      )
  //    )
  //  }

//  public var body: some View {
//    RoundedRectangle(
//      cornerRadius: rounding.removingZoom(
//        zoomLevel,
//        across: zoomRange,
//        sensitivity: sensitivity,
//      )
//    )
//    .fill(.clear)
//    .stroke(
//      colour,
//      lineWidth: lineWidth.removingZoom(
//        zoomLevel,
//        across: zoomRange,
//        sensitivity: sensitivity,
//      ),
//    )
//    .allowsHitTesting(false)
//  }
//}

//
//  DebugText+ViewExts.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 7/4/2026.
//

import SwiftUI

/// Maybe the below stay as the legacy version? Just need to work
/// out how to display or not display stuff
//extension View {
//  public func debugTextOverlay(
//    _ text: String,
//    isEnabled: Bool = true,
//    alignment: Alignment = .topLeading,
//    padding: (Edge.Set, CGFloat?) = (.all, Styles.sizeSmall)
//  ) -> some View {
//    self.modifier(
//      DebugTextSimpleOverlayModifier(
//        text: text,
//        isEnabled: isEnabled,
//        alignment: alignment,
//        padding: padding
//      )
//    )
//  }
//  
//  public func debugTextOverlay(
//    isEnabled: Bool = true,
//    alignment: Alignment = .topLeading,
//    padding: (Edge.Set, CGFloat?) = (.all, Styles.sizeSmall),
//    @DisplayStringBuilder _ text: () -> [DisplayBlock]
//  ) -> some View {
//    self.modifier(
//      DebugTextSimpleOverlayModifier(
//        text: text().output(),
//        isEnabled: isEnabled,
//        alignment: alignment,
//        padding: padding
//      )
//    )
//  }
//}

//
//  Alignment.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 1/5/2026.
//

import SwiftUI

extension Alignment {
  public var displayName: (abbreviated: String, standard: String, full: String) {
    switch self {
      case .top:
        return ("Top", "Top", "Top (H: Center + V: Top)")
        
      case .topLeading:
        return ("T.Lead", "Top Leading", "Top Leading (H: Leading + V: Top)")
        
      case .topTrailing:
        return ("T.Trail", "Top Trailing", "Top Trailing (H: Trailing + V: Top)")
        
      case .bottom:
        return ("Bottom", "Bottom", "Bottom (H: Center + V: Bottom)")
        
      case .bottomLeading:
        return ("B.Lead", "Bottom Leading", "Bottom Leading (H: Leading + V: Bottom)")
        
      case .bottomTrailing:
        return ("B.Trail", "Bottom Trailing", "Bottom Trailing (H: Trailing + V: Bottom)")
        
      case .center:
        return ("Cent.", "Center", "Center (H: Center + V: Center)")
        
      case .centerFirstTextBaseline:
        return (
          "Cent.FTB", "Center First Text Baseline",
          "Center First Text Baseline (H: Center + V: FirstTextBaseline)"
        )
        
      case .centerLastTextBaseline:
        return (
          "Cent.LTB", "Center Last Text Baseline",
          "Center Last Text Baseline (H: Center + V: LastTextBaseline)"
        )
        
      case .leading:
        return ("Lead", "Leading", "Leading (H: Leading + V: Center)")
        
      case .leadingFirstTextBaseline:
        return (
          "Lead.FTB", "Leading First Text Baseline",
          "Leading First Text Baseline (H: Leading + V: FirstTextBaseline)"
        )
        
      case .leadingLastTextBaseline:
        return (
          "Lead.LTB", "Leading Last Text Baseline",
          "Leading Last Text Baseline (H: Leading + V: LastTextBaseline)"
        )
        
      case .trailing:
        return ("Trail.", "Trailing", "Trailing (H: Trailing + V: Center)")
        
      case .trailingFirstTextBaseline:
        return (
          "Trail.FTB", "Trailing First Text Baseline",
          "Trailing First Text Baseline (H: Trailing + V: FirstTextBaseline)"
        )
        
      case .trailingLastTextBaseline:
        return (
          "Trail.LTB", "Trailing Last Text Baseline",
          "Trailing Last Text Baseline (H: Trailing + V: LastTextBaseline)"
        )
        
      default:
        return ("Unknown", "Unknown", "Unknown")
    }
  }
}

//
//  NSRange.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 1/5/2026.
//

import Foundation

extension NSRange {
  
  public func toStringRange(in text: String) -> Range<String.Index>? {
    Range(self, in: text)
  }
}

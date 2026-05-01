//
//  Env+Helpers.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 11/1/2026.
//

import SwiftUI

extension View {

  public func isDebugMode(_ mode: Bool) -> some View {
    self.environment(\.isDebugMode, mode)
  }


  public func helpText(_ text: String) -> some View {
    self.environment(\.helpText, text).help(text)
  }
}

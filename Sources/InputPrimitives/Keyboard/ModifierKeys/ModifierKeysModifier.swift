//
//  Untitled.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 10/5/2025.
//

import SwiftUI

/// Important: Don't forget to provide the entry point for the modifier somewhere
/// in the View hierarchy, high enough to cover Views that need the modifiers.
///
/// ```
/// import SwiftUI
///
/// @main
/// struct ExampleApp: App {
///
///   var body: some Scene {
///     WindowGroup {
///       ContentView()
///         .readModifierKeys() // <- E.g. here
///     }
///   }
/// }
/// ```
public struct ModifierKeysModifier: ViewModifier {

  @State private var modifierKeys: Modifiers = []

  let keysToWatch: EventModifiers
  let onChange: ((Modifiers) -> Void)?

  public func body(content: Content) -> some View {

    if #available(macOS 15, iOS 18, *) {
      content
        .onModifierKeysChanged(
          mask: keysToWatch,
          initial: true,
        ) { _, new in

          let modifiers = Modifiers(from: new)
          self.modifierKeys = modifiers
          onChange?(modifiers)
        }
        .environment(\.modifierKeys, modifierKeys)

    } else {
      #if canImport(AppKit)
      content
        .onAppear {
          NSEvent.addLocalMonitorForEvents(matching: [.flagsChanged]) { event in
            let modifiers = Modifiers(from: event)
            self.modifierKeys = modifiers
            onChange?(modifiers)

            return event
          }
        }
        .environment(\.modifierKeys, modifierKeys)
      #else
      content
      #endif
    }
  }
}

extension View {
  public func readModifierKeys(_ modifiersToWatch: EventModifiers = .all) -> some View {
    self.modifier(
      ModifierKeysModifier(
        keysToWatch: modifiersToWatch,
        onChange: nil,
      )
    )
  }

  public func modifierKeys(
    _ modifiersToWatch: EventModifiers = .all,
    onChange perform: @escaping (Modifiers) -> Void,
  ) -> some View {
    self.modifier(
      ModifierKeysModifier(
        keysToWatch: modifiersToWatch,
        onChange: perform,
      )
    )
  }
}

//
//  Compat+LaunchBehaviour.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 7/5/2026.
//

import SwiftUI

extension Scene {
  @SceneBuilder
  public func defaultLaunchBehaviorCompatible(
    _ behavior: SceneLaunchBehaviorCompatible
  ) -> some Scene {
    if #available(macOS 15, *) {
      defaultLaunchBehavior(behavior.toSceneLaunchBehavior)
    }
  }
}

public enum SceneLaunchBehaviorCompatible: Sendable {

  /// The automatic behavior.
  ///
  /// A scene with the automatic behavior will present itself on launch if it
  /// is the first scene defined by an app and no other scenes have presented
  /// themselves.
  case automatic

  /// The presented behavior. The scene will present itself in the absence of
  /// any previously restored scenes.
  case presented

  /// The suppressed behavior. The scene will not present itself in the
  /// absence of any previously restored scenes.
  case suppressed
}

@available(macOS 15, *)
extension SceneLaunchBehaviorCompatible {
  public var toSceneLaunchBehavior: SceneLaunchBehavior {
    switch self {
      case .automatic: .automatic
      case .presented: .presented
      case .suppressed: .suppressed
    }
  }
}

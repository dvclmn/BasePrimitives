//
//  LabelIcon.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 5/4/2026.
//

/// This is really just for the `@Labeled` macro
public enum LabelIcon: Sendable, Equatable, Codable, Hashable {
  case symbol(String)
  case emoji(String)

  public static func preset(_ iconPreset: Icons) -> Self {
    self.init(stringLiteral: iconPreset.icon)
  }
  public static func emojiFavs(_ emoji: EmojiList) -> Self {
    self.init(stringLiteral: emoji.character)
  }
}
extension LabelIcon: ExpressibleByStringLiteral {
  /// Have chosen `IconLiteral.symbol` as the
  /// most logical path for a string literal init
  public init(stringLiteral value: String) {
    self = .symbol(value)
  }
}

extension LabelIcon: ExpressibleByExtendedGraphemeClusterLiteral {
  /// For easy emoji initialisation
  public init(stringLiteral value: Character) {
    self = .emoji("\(value)")
  }
}

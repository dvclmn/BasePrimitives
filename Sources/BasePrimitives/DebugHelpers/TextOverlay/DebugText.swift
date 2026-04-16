//
//  DebugText.swift
//  BasePrimitives
//
//  Created by Dave Coleman on 16/4/2026.
//

import SwiftUI

@Observable
final class DebugItemStore {
  
  struct Item: Identifiable {
    let id: UUID
    var text: String
  }
  
  private(set) var items: [Item] = []
  
  func set(_ text: String, for id: UUID) {
    if let index = items.firstIndex(where: { $0.id == id }) {
      items[index].text = text
    } else {
      items.append(Item(id: id, text: text))
    }
  }
  
  func remove(for id: UUID) {
    items.removeAll { $0.id == id }
  }
}

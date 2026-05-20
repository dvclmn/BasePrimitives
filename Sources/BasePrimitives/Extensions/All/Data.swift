//
//  Encodable.swift
//  Collection
//
//  Created by Dave Coleman on 19/1/2025.
//

import Foundation

extension Data {
  public var prettyPrinted: String {
    guard
      let object = try? JSONSerialization.jsonObject(with: self, options: []),
      let prettyData = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
      let prettyString = String(data: prettyData, encoding: .utf8)
    else { return String(data: self, encoding: .utf8) ?? "nil" }
    return prettyString
  }
}

//
//  PrintMissing.swift
//  ToolKit
//
//  Created by Dave Coleman on 26/4/2026.
//

import Foundation

/// ```
/// private func missingValue(_ key: String, for consumer: String) -> String {
///   "EnvironmentValue `\(key)` missing, needed by \(consumer)"
/// }
/// ```

// appendInterpolation<T>(_ value: T?, default: @autoclosure () -> some StringProtocol)

//public func printMissing<T>(_ value: T?, for consumer: String) {
//public func printMissing(_ value: Any?, for consumer: String) {

/// Example output:
/// ```
/// `unitSize` missing, needed by `GridLineContext`
/// ```
public func printMissing(_ value: String, for consumer: String) {
  print("`\(value)` missing, needed by `\(consumer)`")
  //  print("`\(String(describing: value))` missing, needed by `\(consumer)`")
}

public func printTimestamped(_ message: String) {
  let value = message + " at \(Date.debug)"
  print(value)
//  print("`\(value)` missing, needed by `\(consumer)`")
  //  print("`\(String(describing: value))` missing, needed by `\(consumer)`")
}

public func printDidNotSatisfy(
  _ value: String,
  expectation: String,
  for consumer: String,
) {
  print("`\(value)` did not match expected result `\(expectation)`, in method `\(consumer)`")
}

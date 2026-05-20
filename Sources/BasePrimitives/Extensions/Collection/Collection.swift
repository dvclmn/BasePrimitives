//
//  Collection.swift
//  Collection
//
//  Created by Dave Coleman on 17/12/2024.
//

extension Collection {
  public var toArray: [Element] {
    return Array(self)
  }
}

extension BidirectionalCollection {
  public func nextIndex(
    after index: Index,
    wrapping: Bool = true,
  ) -> Index? {
    guard !isEmpty else { return nil }

    let next = self.index(after: index)
    guard next != endIndex else {
      return wrapping ? startIndex : nil
    }
    return next
  }

  public func previousIndex(
    before index: Index,
    wrapping: Bool = true,
  ) -> Index? {
    guard !isEmpty else { return nil }

    guard index != startIndex else {
      return wrapping ? self.index(before: endIndex) : nil
    }
    return self.index(before: index)
  }
}

extension BidirectionalCollection where Element: Equatable {
  public func nextElement(
    after element: Element,
    wrapping: Bool = true,
  ) -> Element? {
    guard
      let i = firstIndex(of: element),
      let next = nextIndex(after: i, wrapping: wrapping)
    else { return nil }

    return self[next]
  }

  public func previousElement(
    before element: Element,
    wrapping: Bool = true,
  ) -> Element? {
    guard
      let i = firstIndex(of: element),
      let prev = previousIndex(before: i, wrapping: wrapping)
    else { return nil }

    return self[prev]
  }
}
extension Collection where Element: Hashable {
  /// Was called something like `isAtTop`
  public func isOnlyFirstSelected(
    in selection: Set<Element>
  ) -> Bool {
    guard let firstResultID = self.first else {
      return false
    }

    /// I only want a *single* result selected, and to know
    /// if it's at the top/start of the list
    guard selection.count == 1,
      let firstSelected = selection.first
    else { return false }
    return firstResultID == firstSelected
  }

  public func isOnlyElementSelected(
    _ element: Element,
    in selection: Set<Element>,
  ) -> Bool {
    selection.count == 1 && selection.first == element
  }
}

//
//  Hashable.swift
//  BaseHelpers
//
//  Created by Dave Coleman on 7/9/2025.
//

import Foundation

public protocol HashableID: Identifiable, Sendable where Self.ID: Hashable {}

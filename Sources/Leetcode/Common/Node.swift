//
//  Node.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/28.
//

import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        left = nil
        right = nil
        next = nil
    }
}

//
//  TreeNode.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/2.
//

import Foundation

public class TreeNode : Hashable {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ value: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(left)
        hasher.combine(right)
    }
    
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.value == rhs.value && lhs.left == rhs.left && lhs.right == rhs.right
    }
}

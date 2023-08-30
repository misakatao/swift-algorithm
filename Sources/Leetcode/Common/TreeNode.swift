//
//  TreeNode.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/2.
//

import Foundation

public class TreeNode: Hashable {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }

    public var toString: String {
        var res: [String] = []
        var queue: [TreeNode?] = []
        queue.append(self)
        while !queue.isEmpty {
            let sz = queue.count
            for _ in 0 ..< sz {
                let node = queue.removeFirst()
                if let val = node?.val {
                    res.append("\(val)")
                } else {
                    res.append("null")
                }
                if let left = node?.left {
                    queue.append(left)
                }
                if let right = node?.right {
                    queue.append(right)
                }
            }
        }
        return "[\(res.joined(separator: ","))]"
    }

    public var postSerialize: String {
        return "[" + postSerialize(self) + "]"
    }

    private func postSerialize(_ node: TreeNode?) -> String {
        guard let node = node else { return "null" }
        let left = postSerialize(node.left)
        let right = postSerialize(node.right)
        return "\(left),\(right),\(node.val)"
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(left)
        hasher.combine(right)
    }

    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
    }
}

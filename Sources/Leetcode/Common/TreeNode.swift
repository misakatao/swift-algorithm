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
                if node == nil {
                    res.append("null")
                    continue
                }
                if let val = node?.val {
                    res.append("\(val)")
                }
                queue.append(node?.left)
                queue.append(node?.right)
            }
        }
        return "[\(res.joined(separator: ","))]"
    }
    
    public var preSerialize: String {
        var strings: [String] = []
        preSerialize(self, &strings)
        return "[" + strings.joined(separator: ",") + "]"
    }

    public var postSerialize: String {
        var strings: [String] = []
        postSerialize(self, &strings)
        return "[" + strings.joined(separator: ",") + "]"
    }
    
    private func preSerialize(_ node: TreeNode?, _ strings: inout [String]) {
        guard let node = node else {
            strings.append("null")
            return
        }
        strings.append("\(node.val)")
        preSerialize(node.left, &strings)
        preSerialize(node.right, &strings)
    }

    private func postSerialize(_ node: TreeNode?, _ strings: inout [String]) {
        guard let node = node else {
            strings.append("null")
            return
        }
        postSerialize(node.left, &strings)
        postSerialize(node.right, &strings)
        strings.append("\(node.val)")
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

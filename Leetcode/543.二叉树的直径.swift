//
//  543.二叉树的直径.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/3.
//

import Foundation

extension Solution {
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var maxDiameter = 0
        _ = depth(root, &maxDiameter)
        return maxDiameter
    }
    
    func depth(_ node: TreeNode?, _ maxDiameter: inout Int) -> Int {
        guard let node = node else { return 0 }

        let leftDepth = depth(node.left, &maxDiameter)
        let rightDepth = depth(node.right, &maxDiameter)
        maxDiameter = max(maxDiameter, leftDepth + rightDepth)
        return 1 + max(leftDepth, rightDepth)
    }
}

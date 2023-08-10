//
//  104. 二叉树的最大深度.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/3.
//

import Foundation

extension Solution {
    /*
     给定一个二叉树 root ，返回其最大深度。

     二叉树的 最大深度 是指从根节点到最远叶子节点的最长路径上的节点数。
     */
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}

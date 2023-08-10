//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//
//  二叉树的最小深度

import Foundation

extension Solution {
    /*
     给定一个二叉树，找出其最小深度。
     
     最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
     
     说明：叶子节点是指没有子节点的节点。
     */
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var depth: Int = 1
        var queue: [TreeNode] = []
        queue.append(root)
        
        var visited: Set<TreeNode> = []
        visited.insert(root)
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                if cur.left == nil && cur.right == nil {
                    return depth
                }
                if let left = cur.left, !visited.contains(left) {
                    queue.append(left)
                    visited.insert(left)
                }
                if let right = cur.right, !visited.contains(right) {
                    queue.append(right)
                    visited.insert(right)
                }
            }
            depth += 1
        }
        return depth
    }
}

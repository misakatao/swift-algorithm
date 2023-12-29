//
//  maximum-depth-of-binary-tree.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 104. 二叉树的最大深度
 
 给定一个二叉树 root ，返回其最大深度。

 二叉树的 最大深度 是指从根节点到最远叶子节点的最长路径上的节点数。
 */

import Foundation
import Utils

@main
class Solution {
    
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
//        var depth: Int = 0
//        var queue: [TreeNode] = []
//        queue.append(root)
//        while !queue.isEmpty {
//            let size = queue.count
//            for _ in 0 ..< size {
//                let tmp = queue.removeFirst()
//                if let left = tmp.left {
//                    queue.append(left)
//                }
//                if let right = tmp.right {
//                    queue.append(right)
//                }
//            }
//            depth += 1
//        }
//        return depth
        
//        var res = 0
//        var depth = 0
//        traverse(root, &res, &depth)
//        return res
        
        let left = maxDepth(root.left)
        let right = maxDepth(root.right)
        return max(left, right) + 1
    }
    
    func traverse(_ node: TreeNode?, _ res: inout Int, _ depth: inout Int) {
        guard let node = node else { return }
        depth += 1
        if node.left == nil && node.right == nil {
            res = max(res, depth)
        }
        traverse(node.left, &res, &depth)
        traverse(node.right, &res, &depth)
        depth -= 1
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let root = TreeNode(3)
            root.left = TreeNode(9)
            root.right = TreeNode(20)
            root.right?.left = TreeNode(15)
            root.right?.right = TreeNode(7)
            print("示例1: \(s.maxDepth(root))")
        }
        printTime {
            let root = TreeNode(1)
            root.right = TreeNode(2)
            print("示例2: \(s.maxDepth(root))")
        }
    }
}

//
//  path-sum.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 112. 路径总和
 
 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum 。判断该树中是否存在 根节点到叶子节点 的路径，这条路径上所有节点值相加等于目标和 targetSum 。如果存在，返回 true ；否则，返回 false 。

 叶子节点 是指没有子节点的节点。
 */

import Foundation
import Utils

@main
class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
//        if root.left == nil && root.right == nil {
//            return root.val == targetSum
//        }
//        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
        
        var queue: [(TreeNode, Int)] = []
        queue.append((root, root.val))
        while !queue.isEmpty {
            let (tmp, path) = queue.removeFirst()
            if tmp.left == nil && tmp.right == nil && path == targetSum {
                return true
            }
            if let left = tmp.left {
                queue.append((left, left.val + path))
            }
            if let right = tmp.right {
                queue.append((right, right.val + path))
            }
        }
        return false
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(5)
            node.left = TreeNode(4)
            node.right = TreeNode(8)
            node.left?.left = TreeNode(11)
            node.right?.left = TreeNode(13)
            node.right?.right = TreeNode(4)
            node.left?.left?.left = TreeNode(7)
            node.left?.left?.right = TreeNode(2)
            node.right?.right?.right = TreeNode(1)
            PrintUtil.printTree(node)
            print("示例1: \(s.hasPathSum(node, 22))")
        }
        printTime {
            let node = TreeNode(1)
            node.left = TreeNode(2)
            node.right = TreeNode(3)
            PrintUtil.printTree(node)
            print("示例2: \(s.hasPathSum(node, 5))")
        }
    }
}

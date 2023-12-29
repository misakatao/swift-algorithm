//
//  symmetric-tree.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 101. 对称二叉树

 给你一个二叉树的根节点 root ， 检查它是否轴对称。
 */

import Foundation
import Utils

@main
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return dfs(root.left, root.right)
    }
    
    func dfs(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        if left?.val != right?.val {
            return false
        }
        return dfs(left?.left, right?.right) && dfs(left?.right, right?.left)
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let root = TreeNode(1)
            root.left = TreeNode(2)
            root.right = TreeNode(2)
            root.left?.left = TreeNode(3)
            root.left?.right = TreeNode(4)
            root.right?.left = TreeNode(4)
            root.right?.right = TreeNode(3)
            print("示例1: \(s.isSymmetric(root))")
        }
        printTime {
            let root = TreeNode(1)
            root.left = TreeNode(2)
            root.right = TreeNode(2)
            root.left?.right = TreeNode(3)
            root.right?.right = TreeNode(3)
            print("示例2: \(s.isSymmetric(root))")
        }
    }
}

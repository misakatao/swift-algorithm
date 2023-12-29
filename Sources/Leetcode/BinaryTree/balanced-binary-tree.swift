//
//  balanced-binary-tree.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 110. 平衡二叉树
 
 给定一个二叉树，判断它是否是高度平衡的二叉树。

 本题中，一棵高度平衡二叉树定义为：

 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。
 */

import Foundation
import Utils

@main
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return abs(maxHeight(root.left) - maxHeight(root.right)) <= 1 && isBalanced(root.left) && isBalanced(root.right)
    }
    
    func maxHeight(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        return max(maxHeight(node.left), maxHeight(node.right)) + 1
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let root = TreeNode(3)
            root.left = TreeNode(9)
            root.right = TreeNode(20)
            root.right?.left = TreeNode(15)
            root.right?.right = TreeNode(7)
            print("示例1: \(s.isBalanced(root))")
        }
        printTime {
            let root = TreeNode(1)
            root.left = TreeNode(2)
            root.right = TreeNode(2)
            root.left?.left = TreeNode(3)
            root.left?.right = TreeNode(3)
            root.left?.left?.left = TreeNode(4)
            root.left?.left?.right = TreeNode(4)
            print("示例2: \(s.isBalanced(root))")
        }
    }
}

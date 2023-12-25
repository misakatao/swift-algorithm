//
//  diameter-of-binary-tree.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 543. 二叉树的直径
 
 给你一棵二叉树的根节点，返回该树的 直径 。

 二叉树的 直径 是指树中任意两个节点之间最长路径的 长度 。这条路径可能经过也可能不经过根节点 root 。

 两节点之间路径的 长度 由它们之间边数表示。
 */

import Utils

@main
class Solution {
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var myDiameter = 0
        maxDepth(root, &myDiameter)
        return myDiameter
    }
    
    @discardableResult
    func maxDepth(_ node: TreeNode?, _ myDiameter: inout Int) -> Int {
        guard let node = node else { return 0 }
        let left = maxDepth(node.left, &myDiameter)
        let right = maxDepth(node.right, &myDiameter)
        myDiameter = max(myDiameter, left + right)
        return max(left, right) + 1
    }
 
    static func main() {
        let s = Solution()
        printTime {
            let root = TreeNode(1)
            root.left = TreeNode(2)
            root.right = TreeNode(3)
            root.left?.left = TreeNode(4)
            root.left?.right = TreeNode(5)
            print("示例1: \(s.diameterOfBinaryTree(root))")
        }
        printTime {
            let root = TreeNode(1)
            root.left = TreeNode(2)
            print("示例2: \(s.diameterOfBinaryTree(root))")
        }
    }
}

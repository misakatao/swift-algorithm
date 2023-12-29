//
//  invert-binary-tree.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 226.翻转二叉树
 
 给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。
 */

import Foundation
import Utils

@main
class Solution {
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        root.left = right
        root.right = left
        return root
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(4)
            node.left = TreeNode(2)
            node.right = TreeNode(7)
            node.left?.left = TreeNode(1)
            node.left?.right = TreeNode(3)
            node.right?.left = TreeNode(6)
            node.right?.right = TreeNode(9)
            PrintUtil.printTree(node)
            let newNode = s.invertTree(node)
            print("示例1: \(newNode?.toString ?? "")")
            PrintUtil.printTree(newNode)
        }
        printTime {
            let node = TreeNode(2)
            node.left = TreeNode(1)
            node.right = TreeNode(3)
            PrintUtil.printTree(node)
            let newNode = s.invertTree(node)
            print("示例2: \(newNode?.toString ?? "")")
            PrintUtil.printTree(newNode)
        }
    }
}

//
//  binary-tree-paths.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 257. 二叉树的所有路径
 
 给你一个二叉树的根节点 root ，按 任意顺序 ，返回所有从根节点到叶子节点的路径。

 叶子节点 是指没有子节点的节点。
 */

import Foundation
import Utils

@main
class Solution {
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        return []
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(1)
            node.left = TreeNode(2)
            node.right = TreeNode(3)
            node.left?.right = TreeNode(5)
            print("示例1: \(s.binaryTreePaths(node))")
        }
        printTime {
            let node = TreeNode(1)
            print("示例2: \(s.binaryTreePaths(node))")
        }
    }
}

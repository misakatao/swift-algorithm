//
//  binary-tree-right-side-view.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 199. 二叉树的右视图
 
 给定一个二叉树的 根节点 root，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。
 */

import Foundation
import Utils

@main
class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        return []
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(1)
            node.left = TreeNode(2)
            node.right = TreeNode(3)
            node.left?.right = TreeNode(5)
            node.right?.right = TreeNode(4)
            print("示例1: \(s.rightSideView(node))")
        }
        printTime {
            let node = TreeNode(1)
            node.right = TreeNode(3)
            print("示例2: \(s.rightSideView(node))")
        }
    }
}

//
//  binary-tree-zigzag-level-order-traversal.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 103. 二叉树的锯齿形层序遍历
 
 给你二叉树的根节点 root ，返回其节点值的 锯齿形层序遍历 。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
 */

import Foundation
import Utils

@main
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        return []
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(3)
            node.left = TreeNode(9)
            node.right = TreeNode(20)
            node.right?.left = TreeNode(15)
            node.right?.right = TreeNode(7)
            print("示例1: \(s.zigzagLevelOrder(node))")
        }
        printTime {
            let node = TreeNode(1)
            print("示例2: \(s.zigzagLevelOrder(node))")
        }
    }
}

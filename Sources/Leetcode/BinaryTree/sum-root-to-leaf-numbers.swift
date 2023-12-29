//
//  sum-root-to-leaf-numbers.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 129. 求根节点到叶节点数字之和
 
 给你一个二叉树的根节点 root ，树中每个节点都存放有一个 0 到 9 之间的数字。
 每条从根节点到叶节点的路径都代表一个数字：

 - 例如，从根节点到叶节点的路径 1 -> 2 -> 3 表示数字 123 。
 
 计算从根节点到叶节点生成的 所有数字之和 。

 叶节点 是指没有子节点的节点。
 */

import Foundation
import Utils

@main
class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        return 0
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(1)
            node.left = TreeNode(2)
            node.right = TreeNode(3)
            print("示例1: \(s.sumNumbers(node))")
        }
        printTime {
            let node = TreeNode(4)
            node.left = TreeNode(9)
            node.right = TreeNode(0)
            print("示例2: \(s.sumNumbers(node))")
        }
    }
}

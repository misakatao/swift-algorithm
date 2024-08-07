//
//  count-complete-tree-nodes.swift
//  
//
//  Created by Misaka on 2024/7/18.
//

/**
 222. 完全二叉树的节点个数
 
 给你一棵 完全二叉树 的根节点 root ，求出该树的节点个数。

 完全二叉树 的定义如下：在完全二叉树中，除了最底层节点可能没填满外，其余每层节点数都达到最大值，并且最下面一层的节点都集中在该层最左边的若干位置。若最底层为第 h 层，则该层包含 1~ 2h 个节点。
 */

import Foundation
import Utils

@main
class Solution {
    
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var lf: Int = 0, rh: Int = 0
        var l: TreeNode? = root, r: TreeNode? = root
        while l != nil {
            l = l?.left
            lf += 1
        }
        while r != nil {
            r = r?.right
            rh += 1
        }
        if lf == rh {
            return 1 << rh - 1
            // return Int(pow(2, Double(rh))) - 1
        }
        return 1 + countNodes(root.left) + countNodes(root.right)
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(1)
            node.left = TreeNode(2)
            node.right = TreeNode(3)
            node.left?.left = TreeNode(4)
            node.left?.right = TreeNode(5)
            node.right?.left = TreeNode(6)
            PrintUtil.printTree(node)
            print("示例1: \(s.countNodes(node))")
        }
        printTime {
            let node = TreeNode(1)
            PrintUtil.printTree(node)
            print("示例2: \(s.countNodes(node))")
        }
    }
}

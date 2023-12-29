//
//  same-tree.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 100. 相同的树

 给你两棵二叉树的根节点 p 和 q ，编写一个函数来检验这两棵树是否相同。

 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
 */

import Foundation
import Utils

@main
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if p == nil || q == nil {
            return false
        }
        if p?.val != q?.val {
            return false
        }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let p = TreeNode(1)
            p.left = TreeNode(2)
            p.right = TreeNode(3)
            let q = TreeNode(1)
            q.left = TreeNode(2)
            q.right = TreeNode(3)
            print("示例1: \(s.isSameTree(p, q))")
        }
        printTime {
            let p = TreeNode(1)
            p.left = TreeNode(2)
            let q = TreeNode(1)
            q.right = TreeNode(2)
            print("示例2: \(s.isSameTree(p, q))")
        }
        printTime {
            let p = TreeNode(1)
            p.left = TreeNode(2)
            p.right = TreeNode(1)
            let q = TreeNode(1)
            q.left = TreeNode(1)
            q.right = TreeNode(2)
            print("示例3: \(s.isSameTree(p, q))")
        }
    }
}

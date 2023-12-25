//
//  lowest-common-ancestor-of-a-binary-tree.swift
//  
//
//  Created by Misaka on 2023/12/21.
//

/**
 236. 二叉树的最近公共祖先
 
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
 */

import Utils

@main
class Solution {
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        return find(root, p?.val, q?.val)
    }
    
    func find(_ root: TreeNode?, _ val1: Int?, _ val2: Int?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root.val == val1 || root.val == val2 {
            return root
        }
        let left = find(root.left, val1, val2)
        let right = find(root.right, val1, val2)
        if left != nil && right != nil {
            return root
        }
        return left != nil ? left : right
    }
    
    static func main() {
        
    }
}

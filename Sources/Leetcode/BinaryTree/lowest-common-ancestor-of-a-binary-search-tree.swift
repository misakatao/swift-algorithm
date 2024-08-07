//
//  lowest-common-ancestor-of-a-binary-search-tree.swift
//
//
//  Created by Misaka on 2024/7/18.
//

/**
 235. 二叉搜索树的最近公共祖先
 
 给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 例如，给定如下二叉搜索树:  root = [6,2,8,0,4,7,9,null,null,3,5]
 */

import Foundation
import Utils

@main
class Solution {
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        if p!.val > q!.val {
            // 保证 p.val <= q.val，便于后续情况讨论
            return lowestCommonAncestor(root, q, p)
        }
        if root.val >= p!.val && root.val <= q!.val {
            // p <= root <= q
            // 即 p 和 q 分别在 root 的左右子树，那么 root 就是 LCA
            return root
        }
        if root.val > q!.val {
            // p 和 q 都在 root 的左子树，那么 LCA 在左子树
            return lowestCommonAncestor(root.left, p, q)
        } else {
            // p 和 q 都在 root 的右子树，那么 LCA 在右子树
            return lowestCommonAncestor(root.right, p, q)
        }
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(0)
            let p = TreeNode(0)
            let q = TreeNode(0)
            let res = s.lowestCommonAncestor(node, p, q)
            PrintUtil.printTree(res)
            print("示例1: \(res?.toString ?? "")")
        }
    }
}

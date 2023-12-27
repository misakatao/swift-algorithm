//
//  search-in-a-binary-search-tree.swift
//
//
//  Created by Misaka on 2023/9/1.
//

/**
 700. 二叉搜索树中的搜索
 
 给定二叉搜索树（BST）的根节点 root 和一个整数值 val。
 
 你需要在 BST 中找到节点值等于 val 的节点。 返回以该节点为根的子树。 如果节点不存在，则返回 null 。
 */

import Foundation
import Utils

@main
class Solution {
    
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val > val { return searchBST(root.left, val) }
        if root.val < val { return searchBST(root.right, val) }
        return root
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(0)
            print("示例1: \(s.searchBST(node, 0)?.toString ?? "")")
        }
    }
}

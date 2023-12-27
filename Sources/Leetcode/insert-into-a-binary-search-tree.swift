//
//  insert-into-a-binary-search-tree.swift
//
//
//  Created by Misaka on 2023/9/1.
//

/**
 701. 二叉搜索树中的插入操作
 
 给定二叉搜索树（BST）的根节点 root 和要插入树中的值 value ，将值插入二叉搜索树。 返回插入后二叉搜索树的根节点。 输入数据 保证 ，新值和原始二叉搜索树中的任意节点值都不同。
 
 注意，可能存在多种有效的插入方式，只要树在插入后仍保持为二叉搜索树即可。 你可以返回 任意有效的结果 。
 */

import Foundation
import Utils

@main
class Solution {
    
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        if root.val < val { root.right = insertIntoBST(root.right, val) }
        if root.val > val { root.left = insertIntoBST(root.left, val) }
        return root
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(0)
            print("示例1: \(s.insertIntoBST(node, 0)?.toString ?? "")")
        }
    }
}

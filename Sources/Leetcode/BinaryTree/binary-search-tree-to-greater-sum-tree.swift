//
//  binary-search-tree-to-greater-sum-tree.swift
//
//
//  Created by Misaka on 2023/9/1.
//

/**
 1038. 从二叉搜索树到更大和树
 
 给定一个二叉搜索树 root (BST)，请将它的每个节点的值替换成树中大于或者等于该节点值的所有节点值之和。
 
 提醒一下， 二叉搜索树 满足下列约束条件：
 
 节点的左子树仅包含键 小于 节点键的节点。
 节点的右子树仅包含键 大于 节点键的节点。
 左右子树也必须是二叉搜索树。
 */

import Foundation
import Utils

@main
class Solution {
    
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        var sum = 0
        traverse(root, &sum)
        return root
    }
    
    func traverse(_ node: TreeNode?, _ sum: inout Int) {
        guard let node = node else { return }
        traverse(node.right, &sum)
        sum += node.val
        node.val = sum
        traverse(node.left, &sum)
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(3)
            node.left = TreeNode(4)
            node.right = TreeNode(5)
            let res = s.bstToGst(node)
            PrintUtil.printTree(res)
            print("示例1: \(res?.toString ?? "")")
        }
    }
}

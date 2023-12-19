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

import Utils

@main
class Solution {
    
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        var sum = 0
        func traverse(_ node: TreeNode?) {
            guard let node = node else { return }
            traverse(node.right)
            sum += node.val
            node.val = sum
            traverse(node.left)
        }
        traverse(root)
        return root
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.bstToGst(TreeNode(0))?.toString ?? "")")
        }
        printTime {
            print("示例2: \(s.bstToGst(TreeNode(0))?.toString ?? "")")
        }
        printTime {
            print("示例3: \(s.bstToGst(TreeNode(0))?.toString ?? "")")
        }
    }
}

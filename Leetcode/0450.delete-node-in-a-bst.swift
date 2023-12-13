//
//  swift-algorithm
//
//  Created by Misaka on 2023/9/1.
//
//  删除二叉搜索树中的节点

import Foundation

extension Solution {
    /*
     给定一个二叉搜索树的根节点 root 和一个值 key，删除二叉搜索树中的 key 对应的节点，并保证二叉搜索树的性质不变。返回二叉搜索树（有可能被更新）的根节点的引用。
     
     一般来说，删除节点可分为两个步骤：
     
     首先找到需要删除的节点；
     如果找到了，删除它。
     */
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        var root = root
        guard let node = root else { return nil }
        if node.val == key {
            if node.left == nil { return node.right }
            if node.right == nil { return node.left }
            
            var minNode = node.right
            while minNode?.left != nil {
                minNode = minNode?.left
            }
            node.right = deleteNode(node.right, minNode!.val)
            minNode?.left = node.left
            minNode?.right = node.right
            root = minNode
            return root
        } else if node.val < key {
            node.right = deleteNode(node.right, key)
        } else if node.val > key {
            node.left = deleteNode(node.left, key)
        }
        return node
    }
}

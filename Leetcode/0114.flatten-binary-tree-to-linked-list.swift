//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/28.
//
//  二叉树展开为链表

import Foundation

extension Solution {
    /*
     给你二叉树的根结点 root ，请你将它展开为一个单链表：

     展开后的单链表应该同样使用 TreeNode ，其中 right 子指针指向链表中下一个结点，而左子指针始终为 null 。
     展开后的单链表应该与二叉树 先序遍历 顺序相同。
     */
    func flatten(_ root: TreeNode?) {
//        var preLeft: TreeNode?
//        func dfs(_ node: TreeNode?) {
//            guard let node = node else { return }
//            dfs(node.right)
//            dfs(node.left)
//
//            node.right = preLeft
//            preLeft = node
//            node.left = nil
//        }
//        dfs(root)
        guard let node = root else { return }
        flatten(node.left)
        flatten(node.right)

        let left = node.left
        let right = node.right

        node.left = nil
        node.right = left

        var p: TreeNode? = node
        while p?.right != nil {
            p = p?.right
        }
        p?.right = right
    }
}

//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/28.
//
//  翻转二叉树

import Foundation

extension Solution {
    /*
     给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。
     */
    func invertTree(_ root: TreeNode?) -> TreeNode? {
//        func traverse(_ node: TreeNode?) -> TreeNode? {
//            guard let node = node else { return nil }
//            let tmp = node.left
//            node.left = node.right
//            node.right = tmp
//            let left = traverse(node.left)
//            let right = traverse(node.right)
//            return node
//        }
//        return traverse(root)
        guard let root = root else { return nil }
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        root.left = right
        root.right = left
        return root
    }
}

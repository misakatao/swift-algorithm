//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/29.
//
//  从前序与中序遍历序列构造二叉树

import Foundation

extension Solution {
    /*
     给定两个整数数组 preorder 和 inorder ，其中 preorder 是二叉树的先序遍历， inorder 是同一棵树的中序遍历，请构造二叉树并返回其根节点。
     */
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var valToIndex: [Int: Int] = [:]
        for i in 0 ..< inorder.count {
            valToIndex[inorder[i]] = i
        }
        func build(_ preLeft: Int, _ preRight: Int, _ inLeft: Int, _ inRight: Int) -> TreeNode? {
            if preLeft > preRight {
                return nil
            }
            let val = preorder[preLeft]
            let index = valToIndex[val, default: 0]
            let root = TreeNode(val)
            let leftSize = index - inLeft
            root.left = build(preLeft + 1, preLeft + leftSize, inLeft, index - 1)
            root.right = build(preLeft + leftSize + 1, preRight, index + 1, inRight)
            return root
        }
        return build(0, preorder.count - 1, 0, inorder.count - 1)
    }
}

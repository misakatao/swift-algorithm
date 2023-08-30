//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/29.
//
//  从中序与后序遍历序列构造二叉树

import Foundation

extension Solution {
    /*
     给定两个整数数组 inorder 和 postorder ，其中 inorder 是二叉树的中序遍历， postorder 是同一棵树的后序遍历，请你构造并返回这颗 二叉树 。
     */
    func buildTree2(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var valToIndex: [Int: Int] = [:]
        for i in 0 ..< inorder.count {
            valToIndex[inorder[i]] = i
        }
        func build(_ inLeft: Int, _ inRight: Int, _ postLeft: Int, _ postRight: Int) -> TreeNode? {
            if postLeft > postRight {
                return nil
            }
            let val = postorder[postRight]
            let index = valToIndex[val, default: 0]
            let root = TreeNode(val)
            let leftSize = index - inLeft
            root.left = build(inLeft, index - 1, postLeft, postLeft + leftSize - 1)
            root.right = build(index + 1, inRight, postLeft + leftSize, postRight - 1)
            return root
        }
        return build(0, inorder.count - 1, 0, postorder.count - 1)
    }
}

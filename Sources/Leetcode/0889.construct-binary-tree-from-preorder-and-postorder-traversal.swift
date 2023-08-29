//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/29.
//
//  根据前序和后序遍历构造二叉树

import Foundation

extension Solution {
    /*
     给定两个整数数组，preorder 和 postorder ，其中 preorder 是一个具有 无重复 值的二叉树的前序遍历，postorder 是同一棵树的后序遍历，重构并返回二叉树。
     
     如果存在多个答案，您可以返回其中 任何 一个。
     */
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var valToIndex: [Int : Int] = [:]
        for i in 0..<postorder.count {
            valToIndex[postorder[i]] = i
        }
        func build(_ preLeft: Int, _ preRight: Int, _ postLeft: Int, _ postRight: Int) -> TreeNode? {
            if preLeft > preRight {
                return nil
            }
            let val = preorder[preLeft]
            let root = TreeNode(val)
            if preLeft == preRight {
                return root
            }
            let leftRootVal = preorder[preLeft + 1]
            let index = valToIndex[leftRootVal, default: 0]
            let leftSize = index - postLeft + 1
            root.left = build(preLeft + 1, preLeft + leftSize, postLeft, index)
            root.right = build(preLeft + leftSize + 1, preRight, index + 1, postRight - 1)
            return root
        }
        return build(0, preorder.count - 1, 0, postorder.count - 1)
    }
}

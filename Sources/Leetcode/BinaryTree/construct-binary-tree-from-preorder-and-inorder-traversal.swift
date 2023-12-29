//
//  construct-binary-tree-from-preorder-and-inorder-traversal.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 105. 从前序与中序遍历序列构造二叉树
 
 给定两个整数数组 preorder 和 inorder ，其中 preorder 是二叉树的先序遍历， inorder 是同一棵树的中序遍历，请构造二叉树并返回其根节点。
 */

import Foundation
import Utils

@main
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var valToIndex: [Int : Int] = [:]
        for i in 0 ..< inorder.count {
            valToIndex[inorder[i]] = i
        }
        return build(preorder, inorder, &valToIndex, 0, preorder.count - 1, 0, inorder.count - 1)
    }
    
    func build(_ preorder: [Int], _ inorder: [Int], _ valToIndex: inout [Int : Int], _ preLeft: Int, _ preRight: Int, _ inLeft: Int, _ inRight: Int) -> TreeNode? {
        if preLeft > preRight {
            return nil
        }
        let val = preorder[preLeft]
        let index = valToIndex[val, default: 0]
        let root = TreeNode(val)
        let leftSize = index - inLeft
        root.left = build(preorder, inorder, &valToIndex, preLeft + 1, preLeft + leftSize, inLeft, index - 1)
        root.right = build(preorder, inorder, &valToIndex, preLeft + leftSize + 1, preRight, index + 1, inRight)
        return root
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = s.buildTree([3,9,20,15,7], [9,3,15,20,7])
            PrintUtil.printTree(node)
            print("示例1: \(node?.toString ?? "")")
        }
        printTime {
            let node = s.buildTree([-1], [-1])
            PrintUtil.printTree(node)
            print("示例2: \(node?.toString ?? "")")
        }
    }
}

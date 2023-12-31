//
//  construct-binary-tree-from-inorder-and-postorder-traversal.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 106. 从中序与后序遍历序列构造二叉树
 
 给定两个整数数组 inorder 和 postorder ，其中 inorder 是二叉树的中序遍历， postorder 是同一棵树的后序遍历，请你构造并返回这颗 二叉树 。
 */

import Foundation
import Utils

@main
class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var valToIndex: [Int : Int] = [:]
        for i in 0 ..< inorder.count {
            valToIndex[inorder[i]] = i
        }
        return build(inorder, postorder, &valToIndex, 0, inorder.count - 1, 0, postorder.count - 1)
    }
    
    func build(_ inorder: [Int], _ postorder: [Int], _ valToIndex: inout [Int : Int], _ inLeft: Int, _ inRight: Int, _ postLeft: Int, _ postRight: Int) -> TreeNode? {
        if postLeft > postRight {
            return nil
        }
        let val = postorder[postRight]
        let index = valToIndex[val, default: 0]
        let root = TreeNode(val)
        let leftSize = index - inLeft
        root.left = build(inorder, postorder, &valToIndex, inLeft, index - 1, postLeft, postLeft + leftSize - 1)
        root.right = build(inorder, postorder, &valToIndex, index + 1, inRight, postLeft + leftSize, postRight - 1)
        return root
    }
 
    static func main() {
        let s = Solution()
        printTime {
            let node = s.buildTree([9,3,15,20,7], [9,15,7,20,3])
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

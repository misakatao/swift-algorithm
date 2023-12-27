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
        
        return nil
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

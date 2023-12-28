//
//  construct-binary-tree-from-preorder-and-postorder-traversal.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 889. 根据前序和后序遍历构造二叉树
 
 给定两个整数数组，preorder 和 postorder ，其中 preorder 是一个具有 无重复 值的二叉树的前序遍历，postorder 是同一棵树的后序遍历，重构并返回二叉树。

 如果存在多个答案，您可以返回其中 任何 一个。
 */

import Foundation
import Utils

@main
class Solution {
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        
        return nil
    }
 
    static func main() {
        let s = Solution()
        printTime {
            let node = s.constructFromPrePost([1,2,4,5,3,6,7], [4,5,2,6,7,3,1])
            PrintUtil.printTree(node)
            print("示例1: \(node?.toString ?? "")")
        }
        printTime {
            let node = s.constructFromPrePost([1], [1])
            PrintUtil.printTree(node)
            print("示例2: \(node?.toString ?? "")")
        }
    }
}

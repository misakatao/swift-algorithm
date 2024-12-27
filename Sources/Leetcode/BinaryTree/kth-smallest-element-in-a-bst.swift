//
//  kth-smallest-element-in-a-bst.swift
//
//
//  Created by Misaka on 2023/9/1.
//

/**
 二叉搜索树中第K小的元素
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给定一个二叉搜索树的根节点 root ，和一个整数 k ，请你设计一个算法查找其中第 k 个最小元素（从 1 开始计数）。
     */
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var res = 0
        var rank = 0
        func traverse(_ node: TreeNode?) {
            guard let node = node else { return }
            traverse(node.left)
            rank += 1
            if rank == k {
                res = node.val
                return
            }
            traverse(node.right)
        }
        traverse(root)
        return res
    }
    
    static func main() {
        
    }
}

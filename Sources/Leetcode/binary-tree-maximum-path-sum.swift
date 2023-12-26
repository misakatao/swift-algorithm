//
//  binary-tree-maximum-path-sum.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 124.二叉树中的最大路径和
 
 二叉树中的 路径 被定义为一条节点序列，序列中每对相邻节点之间都存在一条边。同一个节点在一条路径序列中 至多出现一次 。该路径 至少包含一个 节点，且不一定经过根节点。

 路径和 是路径中各节点值的总和。

 给你一个二叉树的根节点 root ，返回其 最大路径和 。
 */

import Foundation
import Utils

@main
class Solution {
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        var sum = Int.min
        traverse(root, &sum)
        return sum
    }
    
    @discardableResult
    func traverse(_ node: TreeNode?, _ sum: inout Int) -> Int {
        guard let node = node else { return 0 }
        let left = traverse(node.left, &sum)
        let right = traverse(node.right, &sum)
        sum = max(sum, left + right + node.val)
        return max(left, right) + node.val
    }
    
    static func main() {
        
    }
}

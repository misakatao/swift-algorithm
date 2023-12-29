//
//  path-sum-ii.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 113. 路径总和 II
 
 给你二叉树的根节点 root 和一个整数目标和 targetSum ，找出所有 从根节点到叶子节点 路径总和等于给定目标和的路径。

 叶子节点 是指没有子节点的节点。
 */

import Foundation
import Utils

@main
class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var res: [[Int]] = []
        guard let root = root else {
            return res
        }
        var queue: [(TreeNode, [Int])] = []
        queue.append((root, []))
        while !queue.isEmpty {
            let (tmp, path) = queue.removeFirst()
            let currentPath = path + [tmp.val]
            
            if tmp.left == nil && tmp.right == nil {
                if currentPath.reduce(0, +) == targetSum {
                    res.append(currentPath)
                }
            } else {
                if let left = tmp.left {
                    queue.append((left, currentPath))
                }
                if let right = tmp.right {
                    queue.append((right, currentPath))
                }
            }
        }
        
//        var path: [TreeNode] = []
//        dfs(root, targetSum, &path, &res)
        
        return res
    }
    
    func dfs(_ node: TreeNode?, _ sum: Int, _ path: inout [TreeNode], _ res: inout [[Int]]) {
        guard let node = node else {
            return
        }
        
        path.append(node)
        if node.left == nil && node.right == nil && sum == node.val {
            res.append(path.map({ $0.val }))
            path.removeLast()
            return
        }
        
        dfs(node.left, sum - node.val, &path, &res)
        dfs(node.right, sum - node.val, &path, &res)
        path.removeLast()
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(5)
            node.left = TreeNode(4)
            node.right = TreeNode(8)
            node.left?.left = TreeNode(11)
            node.right?.left = TreeNode(13)
            node.right?.right = TreeNode(4)
            node.left?.left?.left = TreeNode(7)
            node.left?.left?.right = TreeNode(2)
            node.right?.right?.left = TreeNode(5)
            node.right?.right?.right = TreeNode(1)
            PrintUtil.printTree(node)
            print("示例1: \(s.pathSum(node, 22))")
        }
        printTime {
            let node = TreeNode(1)
            node.left = TreeNode(2)
            node.right = TreeNode(3)
            PrintUtil.printTree(node)
            print("示例2: \(s.pathSum(node, 5))")
        }
    }
}

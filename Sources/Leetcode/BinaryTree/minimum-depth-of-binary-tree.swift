//
//  minimum-depth-of-binary-tree.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 111. 二叉树的最小深度
 
 给定一个二叉树，找出其最小深度。

 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

 说明：叶子节点是指没有子节点的节点。
 */

import Foundation
import Utils

@main
class Solution {
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
//        var depth: Int = 1
//        var queue: [TreeNode] = []
//        queue.append(root)
//        while !queue.isEmpty {
//            let size = queue.count
//            for _ in 0 ..< size {
//                let tmp = queue.removeFirst()
//                if tmp.left == nil && tmp.right == nil {
//                    return depth
//                }
//                if let left = tmp.left {
//                    queue.append(left)
//                }
//                if let right = tmp.right {
//                    queue.append(right)
//                }
//            }
//            depth += 1
//        }
//        return depth
        
        let left = minDepth(root.left)
        let right = minDepth(root.right)
        return root.left == nil || root.right == nil ? left + right + 1 : min(left, right) + 1
    }
 
    static func main() {
        let s = Solution()
        printTime {
            let root = TreeNode(3)
            root.left = TreeNode(9)
            root.right = TreeNode(20)
            root.right?.left = TreeNode(15)
            root.right?.right = TreeNode(7)
            print("示例1: \(s.minDepth(root))")
        }
        printTime {
            let root = TreeNode(2)
            root.right = TreeNode(3)
            root.right?.right = TreeNode(4)
            root.right?.right?.right = TreeNode(5)
            root.right?.right?.right?.right = TreeNode(6)
            print("示例2: \(s.minDepth(root))")
        }
    }
}

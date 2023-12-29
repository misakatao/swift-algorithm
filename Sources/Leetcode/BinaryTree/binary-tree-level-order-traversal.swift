//
//  binary-tree-level-order-traversal.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 102. 二叉树的层序遍历
 
 给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。
 */

import Foundation
import Utils

@main
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var queue: [TreeNode] = []
        queue.append(root!)
        
        var res: [[Int]] = []
        
        while !queue.isEmpty {
            let size = queue.count
            
            var arr: [Int] = []
            for _ in 0 ..< size {
                let node = queue.removeFirst()
                arr.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(arr)
        }
        return res
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(3)
            node.left = TreeNode(9)
            node.right = TreeNode(20)
            node.right?.left = TreeNode(15)
            node.right?.right = TreeNode(7)
            print("示例1: \(s.levelOrder(node))")
        }
        printTime {
            let node = TreeNode(1)
            print("示例2: \(s.levelOrder(node))")
        }
        printTime {
            print("示例3: \(s.levelOrder(nil))")
        }
        printTime {
            let node = TreeNode(1)
            node.left = TreeNode(2)
            node.right = TreeNode(3)
            node.left?.left = TreeNode(4)
            node.left?.right = TreeNode(5)
            node.right?.left = TreeNode(6)
            node.right?.right = TreeNode(7)
            print("示例4: \(s.levelOrder(node))")
        }
    }
}

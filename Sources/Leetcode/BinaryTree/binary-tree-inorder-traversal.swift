//
//  binary-tree-inorder-traversal.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 94.二叉树的中序遍历
 
 给定一个二叉树的根节点 root ，返回 它的 中序 遍历 。
 */

import Foundation
import Utils

@main
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        guard let root = root else {
            return res
        }
        res.append(contentsOf: inorderTraversal(root.left))
        res.append(root.val)
        res.append(contentsOf: inorderTraversal(root.right))
        return res
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(1)
            node.right = TreeNode(2)
            node.right?.left = TreeNode(3)
            print("示例1: \(s.inorderTraversal(node))")
        }
        printTime {
            let node = TreeNode(1)
            print("示例2: \(s.inorderTraversal(node))")
        }
        printTime {
            print("示例3: \(s.inorderTraversal(nil))")
        }
        printTime {
            let node = TreeNode(4)
            node.left = TreeNode(2)
            node.right = TreeNode(6)
            node.left?.left = TreeNode(1)
            node.left?.right = TreeNode(3)
            node.right?.left = TreeNode(5)
            node.right?.right = TreeNode(7)
            print("示例4: \(s.inorderTraversal(node))")
        }
    }
}

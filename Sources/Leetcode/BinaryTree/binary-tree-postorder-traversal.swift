//
//  binary-tree-postorder-traversal.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 145.二叉树的后序遍历
 
 给你一棵二叉树的根节点 root ，返回其节点值的 后序遍历 。
 */

import Foundation
import Utils

@main
class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        guard let root = root else {
            return res
        }
        res.append(contentsOf: postorderTraversal(root.left))
        res.append(contentsOf: postorderTraversal(root.right))
        res.append(root.val)
        return res
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(1)
            node.right = TreeNode(2)
            node.right?.left = TreeNode(3)
            print("示例1: \(s.postorderTraversal(node))")
        }
        printTime {
            let node = TreeNode(1)
            print("示例2: \(s.postorderTraversal(node))")
        }
        printTime {
            print("示例3: \(s.postorderTraversal(nil))")
        }
        printTime {
            let node = TreeNode(7)
            node.left = TreeNode(3)
            node.right = TreeNode(6)
            node.left?.left = TreeNode(1)
            node.left?.right = TreeNode(2)
            node.right?.left = TreeNode(4)
            node.right?.right = TreeNode(5)
            print("示例4: \(s.postorderTraversal(node))")
        }
    }
}

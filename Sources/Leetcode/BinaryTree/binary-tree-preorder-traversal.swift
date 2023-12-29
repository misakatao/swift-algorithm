//
//  binary-tree-preorder-traversal.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 144.二叉树的前序遍历
 
 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
 */

import Foundation
import Utils

@main
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        guard let root = root else {
            return res
        }
        res.append(root.val)
        res.append(contentsOf: preorderTraversal(root.left))
        res.append(contentsOf: preorderTraversal(root.right))
        return res
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(1)
            node.right = TreeNode(2)
            node.right?.left = TreeNode(3)
            print("示例1: \(s.preorderTraversal(node))")
        }
        printTime {
            let node = TreeNode(1)
            print("示例2: \(s.preorderTraversal(node))")
        }
        printTime {
            print("示例3: \(s.preorderTraversal(nil))")
        }
        printTime {
            let node = TreeNode(1)
            node.left = TreeNode(2)
            node.right = TreeNode(5)
            node.left?.left = TreeNode(3)
            node.left?.right = TreeNode(4)
            node.right?.left = TreeNode(6)
            node.right?.right = TreeNode(7)
            print("示例4: \(s.preorderTraversal(node))")
        }
    }
}

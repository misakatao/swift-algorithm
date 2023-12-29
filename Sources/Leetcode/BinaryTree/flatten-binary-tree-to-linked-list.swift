//
//  flatten-binary-tree-to-linked-list.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 114. 二叉树展开为链表
 
 给你二叉树的根结点 root ，请你将它展开为一个单链表：

 - 展开后的单链表应该同样使用 TreeNode ，其中 right 子指针指向链表中下一个结点，而左子指针始终为 null 。
 - 展开后的单链表应该与二叉树 先序遍历 顺序相同。
 */

import Foundation
import Utils

@main
class Solution {
    
    func flatten(_ root: TreeNode?) {
        var pre: TreeNode?
        dfs(root, &pre)
    }
    
    func dfs(_ node: TreeNode?, _ pre: inout TreeNode?) {
        guard let node = node else {
            return
        }
        dfs(node.right, &pre)
        dfs(node.left, &pre)
        node.right = pre
        pre = node
        node.left = nil
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = TreeNode(1)
            node.left = TreeNode(2)
            node.right = TreeNode(5)
            node.left?.left = TreeNode(3)
            node.left?.right = TreeNode(4)
            node.right?.right = TreeNode(6)
            s.flatten(node)
            print("示例1:")
            PrintUtil.printTree(node)
        }
        printTime {
            s.flatten(nil)
            print("示例2:")
        }
        printTime {
            let node = TreeNode(0)
            s.flatten(node)
            print("示例2:")
            PrintUtil.printTree(node)
        }
    }
}

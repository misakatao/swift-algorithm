//
//  merge-two-binary-trees.swift
//
//
//  Created by Misaka on 2023/8/14.
//

/**
 合并二叉树
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你两棵二叉树： root1 和 root2 。

     想象一下，当你将其中一棵覆盖到另一棵之上时，两棵树上的一些节点将会重叠（而另一些不会）。你需要将这两棵树合并成一棵新二叉树。合并的规则是：如果两个节点重叠，那么将这两个节点的值相加作为合并后节点的新值；否则，不为 null 的节点将直接作为新二叉树的节点。

     返回合并后的二叉树。

     注意: 合并过程必须从两个树的根节点开始。
     */
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }

        let merged = TreeNode(root1.val + root2.val)
        merged.left = mergeTrees(root1.left, root2.left)
        merged.right = mergeTrees(root1.right, root2.right)
        return merged
    }
    
    static func main() {
        let testCases = [
            (
                [1,3,2,5],
                [2,1,3,nil,4,nil,7]
            ),
            (
                [1],
                [1,2]
            ),
            (
                [1,2,nil,3],
                [1,nil,2,nil,3]
            )
        ]
        
        let solution = Solution()
        
        for (i, testCase) in testCases.enumerated() {
            print("\nTest case \(i + 1):")
            let root1 = TreeNode.createBinaryTree(testCase.0)
            let root2 = TreeNode.createBinaryTree(testCase.1)
            
            print("Input:")
            print("root1 =", TreeNode.serialize(root1))
            print("root2 =", TreeNode.serialize(root2))
            
            printTime {
                let result = solution.mergeTrees(root1, root2)
                print("\nOutput:", TreeNode.serialize(result))
            }
        }
    }
}

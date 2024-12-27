//
//  smallest-subtree-with-all-the-deepest-nodes.swift
//
//
//  Created by Misaka on 2023/9/6.
//

/**
 具有所有最深节点的最小子树
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给定一个根为 root 的二叉树，每个节点的深度是 该节点到根的最短距离 。
     
     返回包含原始树中所有 最深节点 的 最小子树 。
     
     如果一个节点在 整个树 的任意节点之间具有最大的深度，则该节点是 最深的 。
     
     一个节点的 子树 是该节点加上它的所有后代的集合。
     */
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        func maxDepth(_ node: TreeNode?) -> (TreeNode?, Int) {
            guard let node = node else {
                return (nil, 0)
            }
            let left: (TreeNode?, Int) = maxDepth(node.left)
            let right: (TreeNode?, Int) = maxDepth(node.right)
            
            if left.1 == right.1 {
                return (node, left.1 + 1)
            }
            
            var res: (TreeNode?, Int) = (left.1 > right.1) ? left : right
            res.1 += 1
            return res
        }
        let result: (TreeNode?, Int) = maxDepth(root)
        return result.0
    }
    
    static func main() {
        
    }
}

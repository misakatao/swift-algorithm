//
//  find-largest-value-in-each-tree-row.swift
//
//
//  Created by Misaka on 2023/8/28.
//

/**
 在每个树行中找最大值
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给定一棵二叉树的根节点 root ，请找出该二叉树中每一层的最大值。
     */
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var res: [Int] = []
//        var queue: [TreeNode?] = []
//        queue.append(root)
//        res.append(root.val)
//        while !queue.isEmpty {
//            var maxVal: Int = 0
//            let sz: Int = queue.count
//            for _ in 0..<sz {
//                let cur = queue.removeFirst()
//                maxVal = max(maxVal, cur?.val ?? 0)
//                if cur?.left != nil {
//                    queue.append(cur?.left)
//                }
//                if cur?.right != nil {
//                    queue.append(cur?.right)
//                }
//                res.append(maxVal)
//            }
//        }
        func traverse(_ node: TreeNode?, _ depth: Int) {
            guard let node = node else { return }

            if res.count <= depth {
                res.append(node.val)
            } else {
                res[depth] = max(res[depth], node.val)
            }
            traverse(node.left, depth + 1)
            traverse(node.right, depth + 1)
        }
        traverse(root, 0)
        return res
    }
    
    static func main() {
        let solution = Solution()
        printTime {
            let root1 = TreeNode.fromArray([1,3,2,5,3,nil,9])
            print("示例1: \(solution.largestValues(root1))")
            // 输出: [1,3,9]
        }
        
        printTime {
            let root2 = TreeNode.fromArray([1,2,3])
            print("示例2: \(solution.largestValues(root2))")
            // 输出: [1,3]
        }
        
        printTime {
            print("示例3: \(solution.largestValues(nil))")
            // 输出: []
        }
    }
}

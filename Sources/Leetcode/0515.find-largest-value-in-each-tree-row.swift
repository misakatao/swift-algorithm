//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/28.
//
//  在每个树行中找最大值

import Foundation

extension Solution {
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
}

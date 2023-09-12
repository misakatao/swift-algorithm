//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/3.
//
//  二叉树的前序遍历

import Foundation

extension Solution {
    /*
     给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
     */
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
//        var res: [Int] = []
//        guard let root = root else { return res }
//        res.append(root.val)
//        res.append(contentsOf: preorderTraversal(root.left))
//        res.append(contentsOf: preorderTraversal(root.right))
//        return res
        
        var res: [Int] = []
        var stack: [TreeNode?] = []
        stack.append(root)
        while !stack.isEmpty {
            let top = stack.removeLast()
            if top != nil {
                res.append(top!.val)
            }
            if let right = top?.right {
                stack.append(right)
            }
            if let left = top?.left {
                stack.append(left)
            }
        }
        return res
    }
}

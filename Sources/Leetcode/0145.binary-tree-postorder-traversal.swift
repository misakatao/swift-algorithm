//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/10.
//
//  二叉树的后序遍历

import Foundation

extension Solution {
    /*
     给你一棵二叉树的根节点 root ，返回其节点值的 后序遍历 。
     */
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        guard let root = root else { return res }
        res.append(contentsOf: postorderTraversal(root.left))
        res.append(contentsOf: postorderTraversal(root.right))
        res.append(root.val)
        return res
    }
}

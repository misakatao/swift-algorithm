//
//  144.二叉树的前序遍历.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/3.
//

import Foundation

extension Solution {
    /*
     给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
     */
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = Array<Int>()
        guard let root = root else { return res }
        res.append(root.value)
        res.append(contentsOf: preorderTraversal(root.left))
        res.append(contentsOf: preorderTraversal(root.right))
        return res
    }
}

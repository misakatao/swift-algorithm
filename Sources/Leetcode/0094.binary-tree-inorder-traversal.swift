//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/10.
//
//  二叉树的中序遍历

import Foundation

extension Solution {
    /*
     给定一个二叉树的根节点 root ，返回 它的 中序 遍历 。
     */
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var results = [Int]()
        guard let root = root else { return results }
        results.append(contentsOf: inorderTraversal(root.left))
        results.append(root.value)
        results.append(contentsOf: inorderTraversal(root.right))
        return results
    }
}
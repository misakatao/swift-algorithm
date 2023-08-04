//
//  144.二叉树的前序遍历.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/3.
//

import Foundation

extension Solution {
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var results = [Int]()
        if root == nil {
            return results
        }
        results.append(root!.value)
        results.append(contentsOf: preorderTraversal(root?.left))
        results.append(contentsOf: preorderTraversal(root?.right))
        return results
    }
}

//
//  104. 二叉树的最大深度.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/3.
//

import Foundation

extension Solution {
    
    func maxDepth(_ root: TreeNode?) -> Int {
        return root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
}

//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/3.
//
//  二叉树的直径

import Foundation

extension Solution {
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var maxDiameter = 0
        
        func depth(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }

            let leftDepth = depth(node.left)
            let rightDepth = depth(node.right)
            maxDiameter = max(maxDiameter, leftDepth + rightDepth)
            return 1 + max(leftDepth, rightDepth)
        }
        _ = depth(root)
        return maxDiameter
    }
    

}

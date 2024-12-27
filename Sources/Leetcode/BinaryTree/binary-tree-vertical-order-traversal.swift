//
//  binary-tree-vertical-order-traversal.swift
//
//
//  Created by Misaka on 2023/8/4.
//

/**
 二叉树的垂直遍历
 */

import Foundation
import Utils

var minPos = 0
var maxPos = 0

@main
class Solution {
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        var res: [[Int]] = []
        var map: [Int: [Int]] = [:]

        func dfs(_ node: TreeNode?, _ pos: Int) {
            guard let node = node else { return }

            minPos = min(minPos, pos)
            maxPos = max(maxPos, pos)

            if var values = map[pos] {
                values.append(node.val)
                map[pos] = values
            } else {
                map[pos] = [node.val]
            }

            dfs(node.left, pos - 1)
            dfs(node.right, pos + 1)
        }

        dfs(root, 0)

        for i in minPos ... maxPos {
            if let values = map[i] {
                res.append(values)
            }
        }

        return res
    }
    
    static func main() {
        
    }
}

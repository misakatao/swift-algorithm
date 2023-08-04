//
//  314.二叉树的垂直遍历.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/4.
//

import Foundation

var minPos = 0
var maxPos = 0

extension Solution {
    
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        var result = Array<Array<Int>>()
        var map = Dictionary<Int, Array<Int>>()
        
        dfs(root, 0, &map)
        
        for i in minPos...maxPos {
            if let values = map[i] {
                result.append(values)
            }
        }
        
        return result
    }
    
    func dfs(_ node: TreeNode?, _ pos: Int, _ map: inout [Int: [Int]]) {
        guard let node = node else { return }
        
        minPos = min(minPos, pos)
        maxPos = max(maxPos, pos)
        
        if var values = map[pos] {
            values.append(node.value)
            map[pos] = values
        } else {
            map[pos] = [node.value]
        }
        
        dfs(node.left, pos - 1, &map)
        dfs(node.right, pos + 1, &map)
    }
}

//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/29.
//
//  寻找重复的子树

import Foundation

extension Solution {
    /*
     给你一棵二叉树的根节点 root ，返回所有 重复的子树 。

     对于同一类的重复子树，你只需要返回其中任意 一棵 的根结点即可。

     如果两棵树具有 相同的结构 和 相同的结点值 ，则认为二者是 重复 的。
     */
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var res: [TreeNode?] = []
        var subTrees: [String: Int] = [:]
        func serialize(_ node: TreeNode?) -> String {
            guard let node = node else { return "null" }
            let left = serialize(node.left)
            let right = serialize(node.right)
            let mySelf = left + "," + right + "," + String(node.val)

            let freq = subTrees[mySelf, default: 0]
            if freq == 1 {
                res.append(node)
            }
            subTrees[mySelf] = freq + 1
            return mySelf
        }
        _ = serialize(root)
        return res
    }
}

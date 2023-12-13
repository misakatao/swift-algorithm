//
//  swift-algorithm
//
//  Created by Misaka on 2023/9/1.
//
//  验证二叉搜索树

import Foundation

extension Solution {
    /*
     给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。
     
     有效 二叉搜索树定义如下：
     
     节点的左子树只包含 小于 当前节点的数。
     节点的右子树只包含 大于 当前节点的数。
     所有左子树和右子树自身必须也是二叉搜索树。
     */
    func isValidBST(_ root: TreeNode?) -> Bool {
        func isValidBST(_ root: TreeNode?, _ min: TreeNode?, _ max: TreeNode?) -> Bool {
            guard let root = root else { return true }
            if let min = min, min.val >= root.val { return false }
            if let max = max, max.val <= root.val { return false }
            return isValidBST(root.left, min, root) && isValidBST(root.right, root, max)
        }
        return isValidBST(root, nil, nil)
    }
}
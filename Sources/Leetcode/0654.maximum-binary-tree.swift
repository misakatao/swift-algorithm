//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/29.
//
//  最大二叉树

import Foundation

extension Solution {
    /*
     给定一个不重复的整数数组 nums 。 最大二叉树 可以用下面的算法从 nums 递归地构建:
     
     创建一个根节点，其值为 nums 中的最大值。
     递归地在最大值 左边 的 子数组前缀上 构建左子树。
     递归地在最大值 右边 的 子数组后缀上 构建右子树。
     返回 nums 构建的 最大二叉树 。
     */
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        func build(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
            if left > right {
                return nil
            }
            var maxVal: Int = Int.min
            var maxIdx: Int = -1
            for i in left...right {
                if maxVal < nums[i] {
                    maxVal = nums[i]
                    maxIdx = i
                }
            }
            let root = TreeNode(maxVal)
            root.left = build(nums, left, maxIdx - 1)
            root.right = build(nums, maxIdx + 1, right)
            return root
        }
        return build(nums, 0, nums.count - 1)
    }
}

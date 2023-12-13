//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/22.
//
//  打家劫舍 III

import Foundation

extension Solution {
    /*
     小偷又发现了一个新的可行窃的地区。这个地区只有一个入口，我们称之为 root 。

     除了 root 之外，每栋房子有且只有一个“父“房子与之相连。一番侦察之后，聪明的小偷意识到“这个地方的所有房屋的排列类似于一棵二叉树”。 如果 两个直接相连的房子在同一天晚上被打劫 ，房屋将自动报警。

     给定二叉树的 root 。返回 在不触动警报的情况下 ，小偷能够盗取的最高金额 。
     */
    func rob3(_ root: TreeNode?) -> Int {
        /// 返回一个大小为 2 的数组 `arr`
        /// `arr[0]` 表示不抢 root 的话，得到的最大钱数
        /// `arr[1]` 表示抢 root 的话，得到的最大钱数
        func dp(_ node: TreeNode?) -> [Int] {
            guard let node = node else { return [0, 0] }
            let left = dp(node.left)
            let right = dp(node.right)
            // 抢
            let rob = node.val + left[0] + right[0]
            // 不抢
            let not_rob = max(left[0], left[1]) + max(right[0], right[1])
            return [not_rob, rob]
        }
        let res = dp(root)
        return max(res[0], res[1])
    }
}

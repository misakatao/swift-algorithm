//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//
//  子集

import Foundation

extension Solution {
    /*
     给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。

     解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
     */
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var track: [Int] = []

        func backtrack(_ index: Int) {
            res.append(track)

            for i in index ..< nums.count {
                track.append(nums[i])
                backtrack(i + 1)
                track.removeLast()
            }
        }

        backtrack(0)

        return res
    }
}

//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//
//  子集 II

import Foundation

extension Solution {
    /*
     给你一个整数数组 nums ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。

     解集 不能 包含重复的子集。返回的解集中，子集可以按 任意顺序 排列。
     */
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var track: [Int] = []

        let nums = nums.sorted()

        func backtrack(_ index: Int) {
            res.append(track)
            for i in index ..< nums.count {
                if i > index, nums[i] == nums[i - 1] {
                    continue
                }
                track.append(nums[i])
                backtrack(i + 1)
                track.removeLast()
            }
        }
        backtrack(0)
        return res
    }
}
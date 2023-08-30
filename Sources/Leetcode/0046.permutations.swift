//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/4.
//
//  全排列

import Foundation

extension Solution {
    /*
     给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。
     */
    func permute(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var track: [Int] = []
        var used: [Bool] = Array(repeating: false, count: nums.count)

        func backtrack() {
            if track.count == nums.count {
                res.append(track)
                return
            }

            for i in 0 ..< nums.count {
                if used[i] {
                    continue
                }
                used[i] = true
                track.append(nums[i])
                backtrack()
                track.removeLast()
                used[i] = false
            }
        }

        backtrack()
        return res
    }
}

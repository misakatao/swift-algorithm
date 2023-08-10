//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//
//  全排列 II

import Foundation

extension Solution {
    /*
     给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。
     */
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var track: [Int] = []
        var used: [Bool] = Array(repeating: false, count: nums.count)
        let nums = nums.sorted()
        
        func backtrack() {
            if track.count == nums.count {
                res.append(track)
                return
            }

            for i in 0..<nums.count {
                if used[i] {
                    continue
                }
                if i > 0 && nums[i] == nums[i - 1] && !used[i - 1] {
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

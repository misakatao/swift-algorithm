//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/18.
//
//  得分最高的最小轮调

import Foundation

extension Solution {
    /*
     给你一个数组 nums，我们可以将它按一个非负整数 k 进行轮调，这样可以使数组变为 [nums[k], nums[k + 1], ... nums[nums.length - 1], nums[0], nums[1], ..., nums[k-1]] 的形式。此后，任何值小于或等于其索引的项都可以记作一分。
     
     例如，数组为 nums = [2,4,1,3,0]，我们按 k = 2 进行轮调后，它将变成 [1,3,0,2,4]。这将记为 3 分，因为 1 > 0 [不计分]、3 > 1 [不计分]、0 <= 2 [计 1 分]、2 <= 3 [计 1 分]，4 <= 4 [计 1 分]。
     在所有可能的轮调中，返回我们所能得到的最高分数对应的轮调下标 k 。如果有多个答案，返回满足条件的最小的下标 k 。
     */
    func bestRotation(_ nums: [Int]) -> Int {
        let count: Int = nums.count
        var diff: [Int] = Array(repeating: 0, count: count)
        
        for i in 0..<count {
//            // diff[(i - nums[i] + 1) % count] -= val
//            diff[(count - (nums[i] - i) + 1) % count] -= 1
//            diff[(i + 1) % count] += 1
//            if nums[i] <= i { // nums[i]一开始所在位置就可以得分
//                diff[0] += 1 // 不移动时 nums[i]就产生贡献
//            }
            
            if nums[i] <= i { // nums[i]一开始所在位置就可以得分
                // 不移动时 nums[i]就产生贡献
                diff[0] += 1
                // (i - nums[i] + 1) % count 表示将原数组下标 i 的元素移动到临界值向左 1 位，此时贡献取消，继续左移也不会产生新贡献
                diff[(i - nums[i] + 1) % count] -= 1
                // (i + 1) % count 表示将原数组下标 i 的元素刚好移动到数组末尾，此时重新得分
                diff[(i + 1) % count] += 1
            } else {
                diff[(i + 1) % count] += 1
                // 因为 (i - nums[i] + 1) % count = (count + i - nums[i] + 1) % count = (count - (nums[i] - i) + 1) % count
                diff[(count - (nums[i] - i) + 1) % count] -= 1
            }
        }
        
        var score: Int = 0
        var max: Int = 0
        var best: Int = 0
        for i in 0..<count {
            score += diff[i]
            if score > max {
                max = score
                best = i
            }
        }
        return best
    }
}

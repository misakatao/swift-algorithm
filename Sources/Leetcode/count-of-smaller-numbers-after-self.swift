//
//  count-of-smaller-numbers-after-self.swift
//
//
//  Created by Misaka on 2023/8/31.
//

/**
 计算右侧小于当前元素的个数
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个整数数组 nums ，按要求返回一个新数组 counts 。数组 counts 有该性质： counts[i] 的值是  nums[i] 右侧小于 nums[i] 的元素的数量。
     */
    func countSmaller(_ nums: [Int]) -> [Int] {
        let len = nums.count
        var res: [Int] = Array(repeating: 0, count: len)
        var pairs: [(Int, Int)] = [] // 记录数组的元素值和原始索引
        for i in 0 ..< nums.count {
            pairs.append((nums[i], i))
        }
        var temp: [(Int, Int)] = Array(repeating: (-1, -1), count: len)
        
        func sort(_ lo: Int, _ hi: Int) {
            if lo == hi { return }
            let mid = lo + (hi - lo) / 2
            sort(lo, mid)
            sort(mid + 1, hi)
            
            for i in lo ... hi {
                temp[i] = pairs[i]
            }
            var i = lo
            var j = mid + 1
            for p in lo ... hi {
                if i == mid + 1 {
                    pairs[p] = temp[j]
                    j += 1
                } else if j == hi + 1 {
                    pairs[p] = temp[i]
                    i += 1
                    res[pairs[p].1] += j - mid - 1
                } else if temp[i].0 > temp[j].0 {
                    pairs[p] = temp[j]
                    j += 1
                } else {
                    pairs[p] = temp[i]
                    i += 1
                    res[pairs[p].1] += j - mid - 1
                }
            }
        }
        sort(0, len - 1)
        return res
    }
    
    static func main() {
        let solution = Solution()
        printTime {
            print("示例1: \(solution.countSmaller([5,2,6,1]))")  // 输出: [2,1,1,0]
        }
        printTime {
            print("示例2: \(solution.countSmaller([-1]))")  // 输出: [0]
        }
        printTime {
            print("示例3: \(solution.countSmaller([-1,-1]))")  // 输出: [0,0]
        }
        printTime {
            print("示例4: \(solution.countSmaller([2,0,1]))")  // 输出: [2,0,0]
        }
    }
}

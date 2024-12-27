//
//  longest-consecutive-sequence.swift
//
//
//  Created by Misaka on 2023/9/8.
//

/**
 最长连续序列
 */

import Foundation

import Utils

@main
class Solution {
    /*
     给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。
     
     请你设计并实现时间复杂度为 O(n) 的算法解决此问题。
     */
    func longestConsecutive(_ nums: [Int]) -> Int {
//        let set = Set(nums)
//        var res = 0
//        for num in set {
//            if set.contains(num - 1) {
//                continue
//            }
//            var cur = num
//            var len = 1
//            while set.contains(cur + 1) {
//                cur += 1
//                len += 1
//            }
//            res = max(res, len)
//        }
//        return res
        var map: [Int: Int] = [:]
        for num in nums {
            map[num] = num
        }
        var res = 0
        for num in nums {
            if map[num - 1] == nil {
                var right = map[num]!
                while let temp = map[right + 1] {
                    right = temp
                }
                map[num] = right
                res = max(res, right - num + 1)
            }
        }
        return res
    }
    
    static func main() {
        
    }
}

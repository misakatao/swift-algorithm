//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/31.
//
//  翻转对

import Foundation

extension Solution {
    /*
     给定一个数组 nums ，如果 i < j 且 nums[i] > 2*nums[j] 我们就将 (i, j) 称作一个重要翻转对。
     
     你需要返回给定数组中的重要翻转对的数量。
     */
    func reversePairs(_ nums: [Int]) -> Int {
        let len = nums.count
        var pairs: [(Int, Int)] = []
        for i in 0 ..< len {
            pairs.append((nums[i], i))
        }
        var temp: [(Int, Int)] = Array(repeating: (0, 0), count: len)
        var res = 0
        func sort(_ lo: Int, _ hi: Int) {
            if lo == hi { return }
            let mid = lo + (hi - lo) / 2
            sort(lo, mid)
            sort(mid + 1, hi)
            
            for i in lo ... hi {
                temp[i] = pairs[i]
            }
            var end = mid + 1
            for i in lo ... mid {
                while end <= hi && pairs[i].0 > (pairs[end].0 * 2) {
                    end += 1
                }
                res += end - (mid + 1)
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
                } else if temp[i] > temp[j] {
                    pairs[p] = temp[j]
                    j += 1
                } else {
                    pairs[p] = temp[i]
                    i += 1
                }
            }
        }
        sort(0, len - 1)
        return res
    }
}

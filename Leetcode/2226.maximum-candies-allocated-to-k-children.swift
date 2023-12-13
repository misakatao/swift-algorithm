//
//  swift-algorithm
//
//  Created by Misaka on 2023/9/7.
//
//  每个小孩最多能分到多少糖果

import Foundation

extension Solution {
    /*
     给你一个 下标从 0 开始 的整数数组 candies 。数组中的每个元素表示大小为 candies[i] 的一堆糖果。你可以将每堆糖果分成任意数量的 子堆 ，但 无法 再将两堆合并到一起。
     
     另给你一个整数 k 。你需要将这些糖果分配给 k 个小孩，使每个小孩分到 相同 数量的糖果。每个小孩可以拿走 至多一堆 糖果，有些糖果可能会不被分配。
     
     返回每个小孩可以拿走的 最大糖果数目 。
     */
    func maximumCandies(_ candies: [Int], _ k: Int) -> Int {
        let sum = candies.reduce(0) { partialResult, candy in
            return partialResult + candy
        }
        var left = 1
        var right = sum
        if sum < k { return 0 }
        let f: ((Int) -> Bool) = { x in
            var k = k
            for candy in candies {
                if candy < x {
                    continue
                } else if (candy == x) {
                    k -= 1
                } else {
                    k -= candy / x
                }
            }
            return k <= 0
        }
        while left < right {
            let mid = left + (right - left) / 2
            if f(mid) {
                left = mid
            } else {
                right = mid - 1
            }
        }
        return left
    }
}

//
//  koko-eating-bananas.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 875.爱吃香蕉的珂珂
 
 珂珂喜欢吃香蕉。这里有 n 堆香蕉，第 i 堆中有 piles[i] 根香蕉。警卫已经离开了，将在 h 小时后回来。

 珂珂可以决定她吃香蕉的速度 k （单位：根/小时）。每个小时，她将会选择一堆香蕉，从中吃掉 k 根。如果这堆香蕉少于 k 根，她将吃掉这堆的所有香蕉，然后这一小时内不会再吃更多的香蕉。

 珂珂喜欢慢慢吃，但仍然想在警卫回来前吃掉所有的香蕉。

 返回她可以在 h 小时内吃掉所有香蕉的最小速度 k（k 为整数）。
 */

import Foundation
import Utils

@main
class Solution {
    
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var maxP = 0
        for p in piles {
            maxP = max(maxP, p)
        }
        var left = 1
        var right = maxP
        while left <= right {
            let mid = left + (right - left) / 2
            var hour = 0
            for p in piles {
                hour += p / mid + (p % mid > 0 ? 1 : 0)
            }
            if hour > h {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.minEatingSpeed([3, 6, 7, 11], 8))")
        }
        printTime {
            print("示例2: \(s.minEatingSpeed([30, 11, 23, 4, 20], 5))")
        }
        printTime {
            print("示例3: \(s.minEatingSpeed([30, 11, 23, 4, 20], 6))")
        }
    }
}

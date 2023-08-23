//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/23.
//
//  爱吃香蕉的珂珂

import Foundation

extension Solution {
    /*
     珂珂喜欢吃香蕉。这里有 n 堆香蕉，第 i 堆中有 piles[i] 根香蕉。警卫已经离开了，将在 h 小时后回来。
     
     珂珂可以决定她吃香蕉的速度 k （单位：根/小时）。每个小时，她将会选择一堆香蕉，从中吃掉 k 根。如果这堆香蕉少于 k 根，她将吃掉这堆的所有香蕉，然后这一小时内不会再吃更多的香蕉。
     
     珂珂喜欢慢慢吃，但仍然想在警卫回来前吃掉所有的香蕉。
     
     返回她可以在 h 小时内吃掉所有香蕉的最小速度 k（k 为整数）。
     */
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        func f(_ nums: [Int], _ x: Int) -> Int {
            var time: Int = 0
            for i in 0..<nums.count {
                time += nums[i] / x
                if nums[i] % x > 0 {
                    time += 1
                }
            }
            return time
        }
        var mink: Int = 1
        var maxk: Int = Int(1e9) + 1
        while mink < maxk {
            let mid = mink + (maxk - mink) / 2
            if f(piles, mid) <= h {
                maxk = mid
            } else {
                mink = mid + 1
            }
        }
        return mink
    }
}

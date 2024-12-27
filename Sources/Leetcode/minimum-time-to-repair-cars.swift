//
//  minimum-time-to-repair-cars.swift
//
//
//  Created by Misaka on 2023/9/7.
//

/**
 修车的最少时间
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个整数数组 ranks ，表示一些机械工的 能力值 。ranksi 是第 i 位机械工的能力值。能力值为 r 的机械工可以在 r * n2 分钟内修好 n 辆车。
     
     同时给你一个整数 cars ，表示总共需要修理的汽车数目。
     
     请你返回修理所有汽车 最少 需要多少时间。
     
     注意：所有机械工可以同时修理汽车。
     */
    func repairCars(_ ranks: [Int], _ cars: Int) -> Int {
        var cnt: [Int: Int] = [:]
        var minR = Int.max
        
        for rank in ranks {
            minR = min(minR, rank)
            cnt[rank, default: 0] += 1
        }
        var left = 0
        var right = minR * cars * cars
        
        func f(_ nums: [Int], _ x: Int) -> Int {
            var time = 0
            for (rank, i) in cnt {
                time += Int(sqrt(Double(x / rank))) * i
            }
            return time
        }
        
        while left + 1 < right {
            let mid = left + (right - left) / 2
            if f(ranks, mid) >= cars {
                right = mid
            } else {
                left = mid
            }
        }
        return right
    }
    
    static func main() {
        
    }
}

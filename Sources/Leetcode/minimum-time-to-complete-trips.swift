//
//  minimum-time-to-complete-trips.swift
//
//
//  Created by Misaka on 2023/9/7.
//

/**
 完成旅途的最少时间
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个数组 time ，其中 time[i] 表示第 i 辆公交车完成 一趟旅途 所需要花费的时间。
     
     每辆公交车可以 连续 完成多趟旅途，也就是说，一辆公交车当前旅途完成后，可以 立马开始 下一趟旅途。每辆公交车 独立 运行，也就是说可以同时有多辆公交车在运行且互不影响。
     
     给你一个整数 totalTrips ，表示所有公交车 总共 需要完成的旅途数目。请你返回完成 至少 totalTrips 趟旅途需要花费的 最少 时间。
     */
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        var left = 1
        var right = (time.max() ?? 0) * totalTrips
        func f(_ x: Int) -> Int {
            var res = 0
            for t in time {
                res += x / t
            }
            return res
        }
        while left < right {
            let mid = left + (right - left) / 2
            if f(mid) >= totalTrips {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    static func main() {
        
    }
}

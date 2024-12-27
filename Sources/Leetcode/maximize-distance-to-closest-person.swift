//
//  maximize-distance-to-closest-person.swift
//
//
//  Created by Misaka on 2023/8/22.
//

/**
 到最近的人的最大距离
 */

import Foundation

import Utils

@main
class Solution {
    /*
     给你一个数组 seats 表示一排座位，其中 seats[i] = 1 代表有人坐在第 i 个座位上，seats[i] = 0 代表座位 i 上是空的（下标从 0 开始）。

     至少有一个空座位，且至少有一人已经坐在座位上。

     亚历克斯希望坐在一个能够使他与离他最近的人之间的距离达到最大化的座位上。

     返回他到离他最近的人的最大距离。
     */
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var pre = 0
        var res = 0
        for i in 0 ..< seats.count {
            if seats[i] == 1 {
                if seats[pre] == 0 && pre == 0 {
                    res = max(res, i - pre)
                }
                res = max(res, (i - pre) / 2)
                pre = i
            }
        }
        res = max(res, seats.count - pre - 1)
        return res
    }
    
    static func main() {
        let solution = Solution()
        printTime {
            print("示例1: \(solution.maxDistToClosest([1,0,0,0,1,0,1]))")
            // 输出: 2
            // 解释: 如果亚历克斯坐在第二个空位（seats[2]）上，他到离他最近的人的距离为 2
        }
        
        printTime {
            print("示例2: \(solution.maxDistToClosest([1,0,0,0]))")
            // 输出: 3
            // 解释: 如果亚历克斯坐在最后一个位置上，他离最近的人有 3 个座位远
        }
        
        printTime {
            print("示例3: \(solution.maxDistToClosest([0,1]))")
            // 输出: 1
        }
        
        printTime {
            print("示例4: \(solution.maxDistToClosest([1,0,0,1]))")
            // 输出: 1
        }
        
        printTime {
            print("示例5: \(solution.maxDistToClosest([0,0,1]))")
            // 输出: 2
        }
    }
}

//
//  corporate-flight-bookings.swift
//
//
//  Created by Misaka on 2023/8/17.
//

/**
 航班预订统计
 */

import Foundation
import Utils

@main
class Solution {
    /*
     这里有 n 个航班，它们分别从 1 到 n 进行编号。

     有一份航班预订表 bookings ，表中第 i 条预订记录 bookings[i] = [firsti, lasti, seatsi] 意味着在从 firsti 到 lasti （包含 firsti 和 lasti ）的 每个航班 上预订了 seatsi 个座位。

     请你返回一个长度为 n 的数组 answer，里面的元素是每个航班预定的座位总数。
     */
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var diff: [Int] = Array(repeating: 0, count: n)
        for booking in bookings {
            let i = booking[0] - 1
            let j = booking[1] - 1
            let val = booking[2]

            diff[i] += val
            if j + 1 < n {
                diff[j + 1] -= val
            }
        }
        var res: [Int] = Array(repeating: 0, count: n)
        res[0] = diff[0]
        for i in 1 ..< n {
            res[i] = res[i - 1] + diff[i]
        }
        return res
    }
    
    static func main() {
        
    }
}

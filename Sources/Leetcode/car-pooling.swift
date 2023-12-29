//
//  car-pooling.swift
//
//
//  Created by Misaka on 2023/8/17.
//

/**
 拼车
 */

import Foundation
import Utils

@main
class Solution {
    /*
     车上最初有 capacity 个空座位。车 只能 向一个方向行驶（也就是说，不允许掉头或改变方向）

     给定整数 capacity 和一个数组 trips ,  trip[i] = [numPassengersi, fromi, toi] 表示第 i 次旅行有 numPassengersi 乘客，接他们和放他们的位置分别是 fromi 和 toi 。这些位置是从汽车的初始位置向东的公里数。

     当且仅当你可以在所有给定的行程中接送所有乘客时，返回 true，否则请返回 false。
     */
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var stations = 0
        for trip in trips {
            let toStation = trip[2]

            if toStation + 1 > stations {
                stations = toStation + 1
            }
        }

        var diff: [Int] = Array(repeating: 0, count: stations)
        for trip in trips {
            let val = trip[0] // 乘客数量
            let i = trip[1] // 第 trip[1] 站乘客上车
            let j = trip[2] - 1 // 第 trip[2] 站乘客已经下车，即乘客在车上的区间是 [trip[1], trip[2] - 1]

            diff[i] += val
            if j + 1 < diff.count {
                diff[j + 1] -= val
            }
        }

        var curCapacity = 0
        for i in 0 ..< diff.count {
            curCapacity += diff[i]

            if curCapacity > capacity {
                return false
            }
        }

        return true
    }
}

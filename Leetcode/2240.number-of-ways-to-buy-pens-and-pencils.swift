//
//  swift-algorithm
//
//  Created by Misaka on 2023/9/1.
//
//  买钢笔和铅笔的方案数

import Foundation

extension Solution {
    /*
     给你一个整数 total ，表示你拥有的总钱数。同时给你两个整数 cost1 和 cost2 ，分别表示一支钢笔和一支铅笔的价格。你可以花费你部分或者全部的钱，去买任意数目的两种笔。
     
     请你返回购买钢笔和铅笔的 不同方案数目 。
     */
    func waysToBuyPensPencils(_ total: Int, _ cost1: Int, _ cost2: Int) -> Int {
//        let maxCost1 = total / cost1
//        var res = 0
//        for i in 0 ... maxCost1 {
//            var max = 1
//            if (total - i * cost1) >= cost2 {
//                max += (total - i * cost1) / cost2
//            }
//            res += max
//        }
//        return res
        let n = 1 + total / cost1
        var res = n
        for i in 0 ..< n {
            res += (total - i * cost1) / cost2
        }
        return res
    }
}

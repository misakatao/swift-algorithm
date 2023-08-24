//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/23.
//
//  在 D 天内送达包裹的能力

import Foundation

extension Solution {
    /*
     传送带上的包裹必须在 days 天内从一个港口运送到另一个港口。
     
     传送带上的第 i 个包裹的重量为 weights[i]。每一天，我们都会按给出重量（weights）的顺序往传送带上装载包裹。我们装载的重量不会超过船的最大运载重量。
     
     返回能在 days 天内将传送带上的所有包裹送达的船的最低运载能力。
     */
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        /// - Parameter x: 船的运载能力
        /// - Returns: 需要多少天
        func f(_ x: Int) -> Int {
            var day: Int = 0
            var i: Int = 0
            while i < weights.count {
                var cap: Int = x
                while i < weights.count {
                    if cap < weights[i] {
                        break
                    } else {
                        cap -= weights[i]
                    }
                    i += 1
                }
                day += 1
            }
            return day
        }
        var minS: Int = weights.max() ?? 0 // 船的最小运载能力
        var maxS: Int = weights.reduce(1, +) // 船的最大运载能力
//        for weight in weights {
//            minS = max(minS, weight)
//            maxS += weight
//        }
        while minS < maxS {
            let mid = minS + (maxS - minS) / 2
            if f(mid) <= days {
                maxS = mid
            } else {
                minS = mid + 1
            }
        }
        return minS
    }
}

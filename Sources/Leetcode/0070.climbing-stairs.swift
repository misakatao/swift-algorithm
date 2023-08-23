//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/22.
//
//  爬楼梯

import Foundation

extension Solution {
    /*
     假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
     
     每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
     */
    func climbStairs(_ n: Int) -> Int {
//        var dp_i_2: Int = 0
//        var dp_i_1: Int = 1
//        for _ in 0..<n {
//            let dp_i = dp_i_1 + dp_i_2
//            dp_i_2 = dp_i_1
//            dp_i_1 = dp_i
//        }
//        return dp_i_1
        
        let sqrt5 = sqrt(5.0)
        let phi = (1 + sqrt5) / 2
        let psi = (1 - sqrt5) / 2
        return Int((pow(phi, Double(n + 1)) - pow(psi, Double(n + 1))) / sqrt5)
    }
}

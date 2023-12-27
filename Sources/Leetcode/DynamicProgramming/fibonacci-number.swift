//
//  fibonacci-number.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 509.斐波那契数
 
 斐波那契数 （通常用 F(n) 表示）形成的序列称为 斐波那契数列 。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：

 F(0) = 0，F(1) = 1
 F(n) = F(n - 1) + F(n - 2)，其中 n > 1

 给定 n ，请计算 F(n) 。
 */

import Foundation
import Utils

@main
class Solution {
    
    func fib(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        for i in 2 ..< n + 1 {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
        
//        var dp_i_1 = 1
//        var dp_i_2 = 0
//        for _ in 2 ..< n + 1 {
//            let dp_i = dp_i_1 + dp_i_2
//            dp_i_2 = dp_i_1
//            dp_i_1 = dp_i
//        }
//        return dp_i_1
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.fib(92))")
        }
    }
}

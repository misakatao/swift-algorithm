//
//  climbing-stairs.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 70.爬楼梯
 
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 */

import Foundation
import Utils

@main
class Solution {
    
    func climbStairs(_ n: Int) -> Int {
        var dp_i_1 = 0
        var dp_i_2 = 1
        for _ in 0 ..< n {
            let dp_i = dp_i_1
            dp_i_1 = dp_i_2
            dp_i_2 = dp_i + dp_i_2
        }
        return dp_i_2
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.climbStairs(2))")
        }
        printTime {
            print("示例2: \(s.climbStairs(3))")
        }
        printTime {
            print("示例3: \(s.climbStairs(10))")
        }
    }
}

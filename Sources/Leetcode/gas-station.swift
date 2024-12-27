//
//  gas-station.swift
//  
//
//  Created by Misaka on 2024/12/25.
//

/**
 134. 加油站
 */

import Foundation
import Utils

@main
class Solution {
    /**
     在一条环路上有 n 个加油站，其中第 i 个加油站有汽油 gas[i] 升。
     
     你有一辆油箱容量无限的的汽车，从第 i 个加油站开往第 i+1 个加油站需要消耗汽油 cost[i] 升。你从其中的一个加油站出发，开始时油箱为空。
     
     给定两个整数数组 gas 和 cost ，如果你可以按顺序绕环路行驶一周，则返回出发时加油站的编号，否则返回 -1 。如果存在解，则 保证 它是 唯一 的。
     */
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var total = 0
        var cur = 0
        var idx = 0
        for i in 0 ..< gas.count {
            cur += gas[i] - cost[i]
            total += gas[i] - cost[i]
            if cur < 0 {
                idx = (i + 1) % gas.count
                cur = 0
            }
        }
        return total < 0 ? -1 : idx
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]))")
        }
        printTime {
            print("示例2: \(s.canCompleteCircuit([2,3,4], [3,4,3]))")
        }
    }
}

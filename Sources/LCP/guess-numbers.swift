//
//  guess-numbers.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 LCP 01. 猜数字
 
 小A 和 小B 在玩猜数字。小B 每次从 1, 2, 3 中随机选择一个，小A 每次也从 1, 2, 3 中选择一个猜。他们一共进行三次这个游戏，请返回 小A 猜对了几次？

 输入的guess数组为 小A 每次的猜测，answer数组为 小B 每次的选择。guess和answer的长度都等于3。
 */

import Foundation
import Utils

@main
class Solution {
    
    func game(_ guess: [Int], _ answer: [Int]) -> Int {
        
        return -1
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.game([], []))")
        }
    }
}

//
//  na-ying-bi.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 LCP 06. 拿硬币
 
 桌上有 n 堆力扣币，每堆的数量保存在数组 coins 中。我们每次可以选择任意一堆，拿走其中的一枚或者两枚，求拿完所有力扣币的最少次数。
 */

import Foundation
import Utils

@main
class Solution {
    
    func minCount(_ coins: [Int]) -> Int {
        coins.reduce(0) { $0 + $1/2 + ($1 % 2 == 0 ? 0 : 1) }
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.minCount([4,2,1]))")
        }
        printTime {
            print("示例2: \(s.minCount([2,3,10]))")
        }
    }
}

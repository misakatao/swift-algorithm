//
//  xoh6Oh.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 LCR 001. 两数相除
 
 给定两个整数 a 和 b ，求它们的除法的商 a/b ，要求不得使用乘号 '*'、除号 '/' 以及求余符号 '%' 。

  

 注意：

 整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231, 231−1]。本题中，如果除法结果溢出，则返回 231 − 1
 */

import Foundation
import Utils

@main
class Solution {
    
    func divide(_ a: Int, _ b: Int) -> Int {
        return 0
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.divide(1, 2))")
        }
    }
}

//
//  subtract-the-product-and-sum-of-digits-of-an-integer.swift
//
//
//  Created by Misaka on 2023/8/9.
//

/**
 整数的各位积和之差
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个整数 n，请你帮忙计算并返回该整数「各位数字之积」与「各位数字之和」的差。
     */
    func subtractProductAndSum(_ n: Int) -> Int {
        var multiply = 1
        var add = 0

        var num: Int = n
        while num != 0 {
            let d = num % 10

            multiply *= d
            add += d

            num /= 10
        }
        return multiply - add
    }
    
    static func main() {
        
    }
}

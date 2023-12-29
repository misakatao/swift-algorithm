//
//  nth-magical-number.swift
//
//
//  Created by Misaka on 2023/9/7.
//

/**
 第 N 个神奇数字
 */

import Foundation
import Utils

@main
class Solution {
    /*
     一个正整数如果能被 a 或 b 整除，那么它是神奇的。
     
     给定三个整数 n , a , b ，返回第 n 个神奇的数字。因为答案可能很大，所以返回答案 对 109 + 7 取模 后的值。
     */
    func nthMagicalNumber(_ n: Int, _ a: Int, _ b: Int) -> Int {
        /// 最大公约数
        func gcd(_ x: Int, _ y: Int) -> Int {
            return y == 0 ? x : gcd(y, x % y)
        }
        /// 最小公倍数
        let lcm = a * b / gcd(a, b)
        
        let mod = Int(1e9) + 7
        var left = 0
        var right = n * min(a, b)
        func f(_ x: Int) -> Int {
            return x / a + x / b - x / lcm
        }
        while left < right {
            let mid = left + (right - left) / 2
            if f(mid) >= n {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left % mod
    }
}

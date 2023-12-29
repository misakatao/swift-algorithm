//
//  remove-k-digits.swift
//
//
//  Created by Misaka on 2023/8/24.
//

/**
 移掉 K 位数字
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个以字符串表示的非负整数 num 和一个整数 k ，移除这个数中的 k 位数字，使得剩下的数字最小。请你以字符串形式返回这个最小的数字。
     */
    func removeKdigits(_ num: String, _ k: Int) -> String {
        let nums: [Character] = Array(num)
        var stack: [Character] = []
        var k = k
        for digit in nums {
            while k > 0 && !stack.isEmpty && stack.last! > digit {
                _ = stack.popLast()
                k -= 1
            }
            if digit != "0" || !stack.isEmpty {
                stack.append(digit)
            }
        }
        while k > 0 {
            _ = stack.popLast()
            k -= 1
        }
        return stack.isEmpty ? "0" : String(stack)
    }
}

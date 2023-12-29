//
//  smallest-subsequence-of-distinct-characters.swift
//
//
//  Created by Misaka on 2023/8/24.
//

/**
 不同字符的最小子序列
 */

import Foundation
import Utils

@main
class Solution {
    /*
     返回 s 字典序最小的子序列，该子序列包含 s 的所有不同字符，且只包含一次。
     */
    func smallestSubsequence(_ s: String) -> String {
        let chars: [Character] = Array(s)
        var count: [Character: Int] = [:]
        for ch in chars {
            count[ch, default: 0] += 1
        }
        var inStack: [Character: Bool] = [:]
        var stack: [Character] = []
        for ch in chars {
            count[ch]! -= 1
            if inStack[ch] == true {
                continue
            }
            while let last = stack.last, last > ch, let lastCount = count[last], lastCount > 0 {
                inStack[last] = false
                _ = stack.popLast()
            }
            stack.append(ch)
            inStack[ch] = true
        }
        return String(stack)
    }
}

//
//  3.无重复字符的最长子串.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//

import Foundation

extension Solution {
    /*
     给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。
     */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var left: Int = 0
        var res: Int = 0
        var window = Dictionary<Character, Int>()
        for (rightIndex, rightValue) in chars.enumerated() {
            window[rightValue, default: 0] += 1
            while window[rightValue]! > 1 {
                let leftValue = chars[left]
                left += 1
                window[leftValue]! -= 1
            }
            res = max(res, rightIndex - left + 1)
        }
        return res
    }
}

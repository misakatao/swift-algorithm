//
//  longest-substring-without-repeating-characters.swift
//
//
//  Created by Misaka on 2023/8/7.
//
//  无重复字符的最长子串

import Foundation

import Utils

@main
class Solution {
    /*
     给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。
     */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var res = 0

        var left = 0
        var right = 0
        var window: [Character: Int] = [:]

        let chars: [Character] = Array(s)
        while right < chars.count {
            let rightValue = chars[right]
            // 扩大窗口
            right += 1
            // 进行窗口内数据的一系列更新
            window[rightValue, default: 0] += 1

            // 判断左侧窗口是否要收缩
            while window[rightValue]! > 1 {
                let leftValue = chars[left]
                // 缩小窗口
                left += 1
                // 进行窗口内数据的一系列更新
                window[leftValue]! -= 1
            }
            res = max(res, right - left)
        }
        return res
    }
    
    static func main() {
        let solution = Solution()
        printTime {
            print("示例1: \(solution.lengthOfLongestSubstring("abcabcbb"))")
            // 输出: 3
        }
        
        printTime {
            print("示例2: \(solution.lengthOfLongestSubstring("bbbbb"))")
            // 输出: 1
        }
        
        printTime {
            print("示例3: \(solution.lengthOfLongestSubstring("pwwkew"))")
            // 输出: 3
        }
        
        printTime {
            print("示例4: \(solution.lengthOfLongestSubstring(""))")
            // 输出: 0
        }
        
        printTime {
            print("示例5: \(solution.lengthOfLongestSubstring("dvdf"))")
            // 输出: 3
        }
    }
}

//
//  longest-palindromic-substring.swift
//
//
//  Created by Misaka on 2023/8/2.
//

/**
 最长回文子串
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个字符串 s，找到 s 中最长的回文子串。
     如果字符串的反序与原始字符串相同，则该字符串称为回文字符串。
     */
    func longestPalindrome(_ s: String) -> String {
        let chars: [Character] = Array(s)
        var char3: [Character] = []

        func palindrome(_ chars: [Character], _ l: Int, _ r: Int) -> [Character] {
            var l = l
            var r = r
            while l >= 0 && r <= (chars.count - 1) && chars[l] == chars[r] {
                l -= 1
                r += 1
            }
            return Array(chars[(l + 1) ... r])
        }

        for i in 0 ..< chars.count {
            let char1 = palindrome(chars, i, i)
            let char2 = palindrome(chars, i, i + 1)
            char3 = char3.count > char1.count ? char3 : char1
            char3 = char3.count > char2.count ? char3 : char2
        }
        return String(char3)
    }
    
    static func main() {
        let solution = Solution()
        printTime {
            print("示例1: \(solution.longestPalindrome("babad"))")
            // 输出: "bab" 或 "aba"
        }
        
        printTime {
            print("示例2: \(solution.longestPalindrome("cbbd"))")
            // 输出: "bb"
        }
        
        printTime {
            print("示例3: \(solution.longestPalindrome("a"))")
            // 输出: "a"
        }
        
        printTime {
            print("示例4: \(solution.longestPalindrome("ac"))")
            // 输出: "a"
        }
        
        printTime {
            print("示例5: \(solution.longestPalindrome("racecar"))")
            // 输出: "racecar"
        }
    }
}

//
//  group-anagrams.swift
//
//
//  Created by Misaka on 2023/9/8.
//

/**
 字母异位词分组
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。
     
     字母异位词 是由重新排列源单词的所有字母得到的一个新单词。
     */
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        func encode(_ s: String) -> String {
            var count: [Int] = Array(repeating: 0, count: 26)
            for ch in Array(s) {
                let delta = ch.asciiValue! - Character("a").asciiValue!
                count[Int(delta)] += 1
            }
            return count.map { String(format: "%x", $0) }.joined()
        }
        var memo: [String : [String]] = [:]
        for str in strs {
            let code = String(str.sorted()) // encode(str)
            print(String(format: "%@ : %@", str, code))
            if memo[code] == nil {
                memo[code] = []
            }
            memo[code]?.append(str)
        }
        var res: [[String]] = []
        for group in memo.values {
            res.append(group)
        }
        return res
    }
    
    static func main() {
        let solution = Solution()
        printTime {
            print("示例1: \(solution.groupAnagrams(["eat","tea","tan","ate","nat","bat"]))")
            // 输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
        }
        
        printTime {
            print("示例2: \(solution.groupAnagrams([""]))")
            // 输出: [[""]]
        }
        
        printTime {
            print("示例3: \(solution.groupAnagrams(["a"]))")
            // 输出: [["a"]]
        }
    }
}

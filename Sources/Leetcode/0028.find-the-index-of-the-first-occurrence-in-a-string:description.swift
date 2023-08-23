//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/23.
//
//  找出字符串中第一个匹配项的下标

import Foundation

extension Solution {
    /*
     给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串的第一个匹配项的下标（下标从 0 开始）。如果 needle 不是 haystack 的一部分，则返回  -1 。
     */
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let haystacks: [Character] = Array(haystack)
        let needles: [Character] = Array(needle)
        if haystacks.count < needles.count {
            return -1
        }
//        for i in 0...(haystacks.count - needles.count) {
//            let sub = String(haystacks[i..<(i + needles.count)])
//            if sub == needle {
//                return i
//            }
//        }
        func buildNextArray(_ pattern: String) -> [Int] {
            let patterns: [Character] = Array(pattern)
            var next: [Int] = Array(repeating: 0, count: patterns.count)
            var i: Int = 1
            var j: Int = 0
            while i < patterns.count {
                while j > 0 && patterns[i] != patterns[j] {
                    j = next[j - 1]
                }
                if patterns[i] == patterns[j] {
                    j += 1
                }
                next[i] = j
                i += 1
            }
            return next
        }
        var i: Int = 0
        var j: Int = 0
        let next = buildNextArray(needle)
        while i < haystacks.count {
            while j > 0 && haystacks[i] != needles[j] {
                j = next[j - 1]
            }
            if haystacks[i] == needles[j] {
                j += 1
            }
            if j == needles.count {
                return i - needles.count + 1
            }
            i += 1
        }
        return -1
    }
}

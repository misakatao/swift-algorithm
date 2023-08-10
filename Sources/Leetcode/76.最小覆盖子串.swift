//
//  76.最小覆盖子串.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/9.
//

import Foundation

extension Solution {
    /*
     给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 "" 。
     
     注意：
     对于 t 中重复字符，我们寻找的子字符串中该字符数量必须不少于 t 中该字符数量。
     如果 s 中存在这样的子串，我们保证它是唯一的答案。
     */
    func minWindow(_ s: String, _ t: String) -> String {
        // 存储滑动窗口的字符及其出现次数
        var window: [Character : Int] = [:]
        // 存储字符串t的字符及其出现次数
        var needs: [Character : Int] = [:]
        for c in Array(t) {
            needs[c, default: 0] += 1
        }
        print("needs: \(needs)")
        
        var left: Int = 0
        var right: Int = 0
        
        var start: Int = 0 // 最小子串的起始索引
        var len: Int = Int.max // 最小子串的长度
        
        var valid: Int = 0 // 记录滑动窗口中已经包含了字符串t中字符的个数
        
        let chars: [Character] = Array(s)
        while right < chars.count {
            let rightValue = chars[right]
            // 扩大右窗口
            right += 1
            // 进行窗口内数据的一系列更新
            if let count = needs[rightValue] {
                window[rightValue, default: 0] += 1
                
                if window[rightValue] == count {
                    valid += 1
                }
            }
            print("valid: \(valid) - window: \(window) - [\(left), \(right))")
            // 判断左侧窗口是否要收缩
            while valid == needs.count { // window 和 needs 相等
                print("-- start: \(start) - len: \(len)")
                if (right - left) < len {
                    start = left
                    len = right - left
                }
                
                let leftValue = chars[left]
                // 缩小左窗口
                left += 1
                // 进行窗口内数据的一系列更新
                if let count = needs[leftValue] {
                    if window[leftValue] == count {
                        valid -= 1
                    }
                    window[leftValue]! -= 1
                }
            }
        }
        
        if start + len > chars.count { return "" }
        return String(chars[start...(start + len - 1)])
    }
}

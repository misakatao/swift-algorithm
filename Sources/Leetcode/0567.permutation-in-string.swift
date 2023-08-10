//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/9.
//
//  字符串的排列

import Foundation

extension Solution {
    /*
     给你两个字符串 s1 和 s2 ，写一个函数来判断 s2 是否包含 s1 的排列。如果是，返回 true ；否则，返回 false 。

     换句话说，s1 的排列之一是 s2 的 子串 。
     */
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let chars1: [Character] = Array(s1)
        let chars2: [Character] = Array(s2)
        
        var window: [Character : Int] = [:]
        
        var needs: [Character : Int] = [:]
        for c in chars1 {
            needs[c, default: 0] += 1
        }
        print("needs: \(needs)")
        
        var left: Int = 0
        var right: Int = 0
        
        var valid: Int = 0 // 记录滑动窗口中已经包含了字符串t中字符的个数
        
        while right < chars2.count {
            let rightValue = chars2[right]
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
            while (right - left) == chars1.count { // window 和字符串 t 长度相等
                // 判断 window 和 needs 是否相等
                if valid == needs.count {
                    return true
                }
                
                let leftValue = chars2[left]
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
        
        return false
    }
}

//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/10.
//
//  找到字符串中所有字母异位词

import Foundation

extension Solution {
    /*
     给定两个字符串 s 和 p，找到 s 中所有 p 的 异位词 的子串，返回这些子串的起始索引。不考虑答案输出的顺序。
     
     异位词 指由相同字母重排列形成的字符串（包括相同的字符串）。
     */
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let charS: [Character] = Array(s)
        let charP: [Character] = Array(p)
        
        var window: [Character : Int] = [:]
        var needs: [Character : Int] = [:]
        for c in charP {
            needs[c, default: 0] += 1
        }
        print("needs: \(needs)")
        
        var left: Int = 0
        var right: Int = 0
        
        var valid: Int = 0 // 记录滑动窗口中已经包含了字符串t中字符的个数
        var res: [Int] = []
        
        while right < charS.count {
            let rightValue = charS[right]
            // 扩大右窗口
            right += 1
            // 进行窗口内数据更新
            if let count = needs[rightValue] {
                window[rightValue, default: 0] += 1
                
                if window[rightValue] == count {
                    valid += 1
                }
            }
            print("valid: \(valid) - window: \(window) - [\(left), \(right))")
            // 判断左侧窗口是否要收缩
            while (right - left) == charP.count { // window 和字符串 p 长度相等
                // 判断 window 和 needs 是否相等
                if valid == needs.count {
                    res.append(left)
                }
                
                let leftValue = charS[left]
                // 缩小左窗口
                left += 1
                // 进行窗口内数据更新
                if let count = needs[leftValue] {
                    if window[leftValue] == count {
                        valid -= 1
                    }
                    window[leftValue]! -= 1
                }
            }
        }
        
        return res
    }
}

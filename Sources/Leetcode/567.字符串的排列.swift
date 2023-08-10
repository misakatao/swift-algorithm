//
//  567.字符串的排列.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/9.
//

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
        
        var left: Int = 0
        var right: Int = 0
        
        var valid: Int = 0
        
        while right < chars2.count {
            let rightValue = chars2[right]
            right += 1
            
            if let index = needs[rightValue] {
                window[rightValue, default: 0] += 1
                
                if window[rightValue] == index {
                    valid += 1
                }
            }
            
            print(window)
            
            while (right - left) >= chars1.count {
                
                if valid == needs.count {
                    return true
                }
                
                let leftValue = chars2[left]
                left += 1
                
                if let index = needs[leftValue] {
                    if window[leftValue] == index {
                        valid -= 1
                    }
                    window[leftValue]! -= 1
                }
            }
        }
        
        return false
    }
}

//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//
//  无重复字符的最长子串

import Foundation

extension Solution {
    /*
     给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。
     */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var res: Int = 0
        
        var left: Int = 0
        var right: Int = 0
        var window: [Character : Int] = [:]
        
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
}

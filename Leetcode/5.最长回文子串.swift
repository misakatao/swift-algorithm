//
//  5.最长回文子串.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/2.
//

import Foundation

extension Solution {
    
    func palindrome(_ chars: [Character], _ l: Int, _ r: Int) -> [Character] {
        var l = l
        var r = r
        while l >= 0 && r <= (chars.count - 1) && chars[l] == chars[r] {
            l -= 1
            r += 1
        }
        return Array(chars[(l+1)...r])
    }
    
    func longestPalindrome(_ s: String) -> String {
        
        let chars: [Character] = Array(s)
        var char3: [Character] = []
        for i in 0..<chars.count {
            let char1 = palindrome(chars, i, i)
            let char2 = palindrome(chars, i, i+1)
            char3 = char3.count > char1.count ? char3 : char1
            char3 = char3.count > char2.count ? char3 : char2
        }
        return String(char3)
    }
}

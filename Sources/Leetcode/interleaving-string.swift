//
//  interleaving-string.swift
//
//
//  Created by Misaka on 2023/9/8.
//

/**
 交错字符串
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给定三个字符串 s1、s2、s3，请你帮忙验证 s3 是否是由 s1 和 s2 交错 组成的。
     
     两个字符串 s 和 t 交错 的定义与过程如下，其中每个字符串都会被分割成若干 非空 子字符串：
     
     s = s1 + s2 + ... + sn
     t = t1 + t2 + ... + tm
     |n - m| <= 1
     交错 是 s1 + t1 + s2 + t2 + s3 + t3 + ... 或者 t1 + s1 + t2 + s2 + t3 + s3 + ...
     注意：a + b 意味着字符串 a 和 b 连接。
     */
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if s1.count + s2.count != s3.count {
            return false
        }
        
        let s1 = Array(s1)
        let s2 = Array(s2)
        let s3 = Array(s3)
        
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: s2.count + 1), count: s1.count + 1)
        dp[0][0] = true
        
        var i = 1
        while i <= s1.count && s1[i - 1] == s3[i - 1] { dp[i][0] = true; i += 1 }
        var j = 1
        while j <= s2.count && s2[j - 1] == s3[j - 1] { dp[0][j] = true; j += 1 }
        for i in 0 ... s1.count {
            for j in 0 ... s2.count {
                if i > 0 && j > 0 {
                    dp[i][j] = (dp[i - 1][j] && s3[i + j - 1] == s1[i - 1]) || (dp[i][j - 1] && s3[i + j - 1] == s2[j - 1])
                }
            }
        }
        return dp[s1.count][s2.count]
        
//        for i in 0 ... s1.count {
//            for j in 0 ... s2.count {
//                if i > 0 {
//                    dp[i][j] = dp[i][j] || (dp[i - 1][j] && s1[i - 1] == s3[i + j - 1])
//                }
//                if j > 0 {
//                    dp[i][j] = dp[i][j] || (dp[i][j - 1] && s2[j - 1] == s3[i + j - 1])
//                }
//            }
//        }
//        return dp[s1.count][s2.count]
        
//        var memo: [[Int]] = Array(repeating: Array(repeating: -1, count: s2.count + 1), count: s1.count + 1)
//        func dp(_ i: Int, _ j: Int) -> Bool {
//            let k = i + j
//            if k == s3.count {
//                return true
//            }
//
//            if memo[i][j] != -1 {
//                return memo[i][j] == 1
//            }
//
//            var res = false
//            // 如果，s1[i] 可以匹配 s3[k]，那么填入 s1[i] 试一下
//            if i < s1.count && s1[i] == s3[k] {
//                res = dp(i + 1, j)
//            }
//            // 如果，s1[i] 匹配不了，s2[j] 可以匹配，那么填入 s2[j] 试一下
//            if j < s2.count && s2[j] == s3[k] {
//                res = res || dp(i, j + 1)
//            }
//
//            memo[i][j] = res ? 1 : 0
//
//            return res
//        }
//        return dp(0, 0)
    }
}

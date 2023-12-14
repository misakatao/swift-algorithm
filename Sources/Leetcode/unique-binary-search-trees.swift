//
//  unique-binary-search-trees.swift
//
//
//  Created by Misaka on 2023/9/1.
//

/**
 不同的二叉搜索树
 
 给你一个整数 n ，求恰由 n 个节点组成且节点值从 1 到 n 互不相同的 二叉搜索树 有多少种？返回满足题意的二叉搜索树的种数。
 */

import Utils

@main
class Solution {
    
    func numTrees(_ n: Int) -> Int {
//        var memo: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
//        func count(_ lo: Int, _ hi: Int) -> Int {
//            if lo > hi { return 1 }
//            if memo[lo][hi] != 0 { return memo[lo][hi] }
//            var res = 0
//            for i in lo ... hi {
//                let left = count(lo, i - 1)
//                let right = count(i + 1, hi)
//                res += left * right
//            }
//            memo[lo][hi] = res
//            return res
//        }
//        return count(1, n)
        if n <= 2 { return 1 }
        var dp: [Int] = Array(repeating: 0 , count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2 ... n {
            for j in 0 ... (i - 1) {
                dp[i] += dp[j] * dp[i - j - 1]
            }
        }
        return dp[n]
    }
    
    static func main() {
        
    }
}

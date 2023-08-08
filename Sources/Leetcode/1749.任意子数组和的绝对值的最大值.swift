//
//  1749.任意子数组和的绝对值的最大值.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/8.
//

import Foundation

extension Solution {
    /*
     给你一个整数数组 nums 。一个子数组 [numsl, numsl+1, ..., numsr-1, numsr] 的 和的绝对值 为 abs(numsl + numsl+1 + ... + numsr-1 + numsr) 。
     
     请你找出 nums 中 和的绝对值 最大的任意子数组（可能为空），并返回该 最大值 。
     
     abs(x) 定义如下：
     
     如果 x 是负整数，那么 abs(x) = -x 。
     如果 x 是非负整数，那么 abs(x) = x 。
     */
    func maxAbsoluteSum(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var positivePre: Int = 0
        var positiveRes: Int = 0
        
        var negativePre: Int = 0
        var negativeRes: Int = 0
        
        for i in 0..<nums.count {
            positivePre = max(positivePre + nums[i], nums[i])
            positiveRes = max(positiveRes, positivePre)
            
            negativePre = min(negativePre + nums[i], nums[i])
            negativeRes = min(negativeRes, negativePre)
        }
        return max(positiveRes, -negativeRes)
    }
}

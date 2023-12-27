//
//  subsets.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 78.子集
 
 给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。

 解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
 */

import Foundation
import Utils

@main
class Solution {
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        
        return []
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.subsets([]))")
        }
    }
}

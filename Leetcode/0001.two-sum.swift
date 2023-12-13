//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/2.
//
//

/*
 两数之和
 
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
 */

import Foundation
import Utils

@main
class Solution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var tempHash: [Int: Int] = [:]
        for (index, value) in nums.enumerated() {
            if let idx = tempHash[target - value] {
                return [idx, index]
            } else {
                tempHash[value] = index
            }
        }
        return [0]
    }
    
    static func main() {
        let s = Solution()
        print("耗时: \(Utils.measureTime { print("示例1: \(s.twoSum([1,4,3,2,5], 9))") }) ms")
    }
}

//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/21.
//
//  三数之和

import Foundation

extension Solution {
    /*
     给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请
     
     你返回所有和为 0 且不重复的三元组。
     
     注意：答案中不可以包含重复的三元组。
     */
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        func nSum(_ nums: [Int], _ n: Int, _ start: Int, _ target: Int) -> [[Int]] {
            var res: [[Int]] = []
            if n < 2 || n > nums.count {
                return res
            }
            if n == 2 {
                var left: Int = start
                var right: Int = nums.count - 1
                while left < right {
                    let sum = nums[left] + nums[right]
                    let leftS = nums[left]
                    let rightS = nums[right]
                    if sum < target {
                        while left < right && nums[left] == leftS {
                            left += 1
                        }
                    } else if sum > target {
                        while left < right && nums[right] == rightS {
                            right -= 1
                        }
                    } else {
                        res.append([leftS, rightS])
                        while left < right && nums[left] == leftS {
                            left += 1
                        }
                        while left < right && nums[right] == rightS {
                            right -= 1
                        }
                    }
                }
            } else {
                var i: Int = 0
                while i < nums.count {
                    var subs: [[Int]] = nSum(nums, n - 1, i + 1, target - nums[i])
                    for j in 0..<subs.count {
                        subs[j].append(nums[i])
                        res.append(subs[j])
                    }
                    while i < nums.count - 1 && nums[i] == nums[i + 1] {
                        i += 1
                    }
                    i += 1
                }
            }
            
            return res
        }
        return nSum(nums.sorted(), 3, 0, 0)
    }
}

//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/22.
//
//  四数之和

import Foundation

extension Solution {
    /*
     给你一个由 n 个整数组成的数组 nums ，和一个目标值 target 。请你找出并返回满足下述全部条件且不重复的四元组 [nums[a], nums[b], nums[c], nums[d]] （若两个四元组元素一一对应，则认为两个四元组重复）：
     
     0 <= a, b, c, d < n
     a、b、c 和 d 互不相同
     nums[a] + nums[b] + nums[c] + nums[d] == target
     你可以按 任意顺序 返回答案 。
     */
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
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
                var i: Int = start
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
        return nSum(nums.sorted(), 4, 0, target)
    }
}

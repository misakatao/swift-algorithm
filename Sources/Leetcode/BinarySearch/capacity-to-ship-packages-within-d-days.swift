//
//  capacity-to-ship-packages-within-d-days.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 1011. 在 D 天内送达包裹的能力
 
 传送带上的包裹必须在 days 天内从一个港口运送到另一个港口。

 传送带上的第 i 个包裹的重量为 weights[i]。每一天，我们都会按给出重量（weights）的顺序往传送带上装载包裹。我们装载的重量不会超过船的最大运载重量。

 返回能在 days 天内将传送带上的所有包裹送达的船的最低运载能力。
 */

import Utils

@main
class Solution {
    
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        
        var left = 0
        var right = 1
        for w in weights {
            left = max(left, w)
            right += w
        }
        while left < right {
            let mid = left + (right - left) / 2
            var time = 1
            var sum = 0
            for i in weights {
                sum += i
                if sum > mid {
                    time += 1
                    sum = i
                }
            }
            if time > days {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    func ff(_ weights: [Int], _ mid: Int) -> Int {
        var time = 0
        var i = 0
        while i < weights.count {
            var cap = mid
            while i < weights.count {
                if cap < weights[i] {
                    break
                } else {
                    cap -= weights[i]
                    i += 1
                }
            }
            time += 1
        }
        return time
    }
    
    func f(_ weights: [Int], _ mid: Int) -> Int {
        var sum = 0
        var time = 0
        for i in weights {
            sum += i
            if sum > mid {
                time += 1
                sum = mid - i
            }
        }
        return time
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.shipWithinDays([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5))")
        }
        printTime {
            print("示例2: \(s.shipWithinDays([3, 2, 2, 4, 1, 4], 3))")
        }
        printTime {
            print("示例3: \(s.shipWithinDays([1, 2, 3, 1, 1], 4))")
        }
    }
}

//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/18.
//
//  3n 块披萨

import Foundation

extension Solution {
    /*
     给你一个披萨，它由 3n 块不同大小的部分组成，现在你和你的朋友们需要按照如下规则来分披萨：
     
     你挑选 任意 一块披萨。
     Alice 将会挑选你所选择的披萨逆时针方向的下一块披萨。
     Bob 将会挑选你所选择的披萨顺时针方向的下一块披萨。
     重复上述过程直到没有披萨剩下。
     每一块披萨的大小按顺时针方向由循环数组 slices 表示。
     
     请你返回你可以获得的披萨大小总和的最大值。
     */
    func maxSizeSlices(_ slices: [Int]) -> Int {
        
        func maxSizeSlices(_ slices: [Int], _ start: Int, _ end: Int) -> Int {
            let m = end - start + 1
            let pick = (m + 1) / 3
            var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: pick + 1), count: m + 1)
            for i in 1..<m + 1 {
                let size = slices[start + i - 1]
                for j in 1..<pick + 1 {
                    let preSize = i > 1 ? dp[i - 2][j - 1] : 0
                    dp[i][j] = max(preSize + size, dp[i - 1][j])
                }
            }
            return dp[m][pick]
        }
        
        let count = slices.count
        return max(maxSizeSlices(slices, 0, count - 2), maxSizeSlices(slices, 1, count - 1))
    }
}

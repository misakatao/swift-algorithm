//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/29.
//
//  带因子的二叉树

import Foundation

extension Solution {
    /*
     给出一个含有不重复整数元素的数组 arr ，每个整数 arr[i] 均大于 1。

     用这些整数来构建二叉树，每个整数可以使用任意次数。其中：每个非叶结点的值应等于它的两个子结点的值的乘积。

     满足条件的二叉树一共有多少个？答案可能很大，返回 对 109 + 7 取余 的结果。
     */
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
//        let module = Int(1e9 + 7)
//        let arr = arr.sorted()
//        var dp: [Int] = Array(repeating: 0, count: arr.count)
//        var res: Int = 0
//        for i in 0..<arr.count {
//            dp[i] = 1
//            var left: Int = 0
//            var right: Int = i - 1
//            while left <= right {
//                while right >= left && (arr[left] * arr[right]) > arr[i] {
//                    right -= 1
//                }
//                if right >= left && (arr[left] * arr[right]) == arr[i] {
//                    if right != left {
//                        dp[i] = (dp[i] + dp[left] * dp[right] * 2) % module
//                    } else {
//                        dp[i] = (dp[i] + dp[left] * dp[right]) % module
//                    }
//                }
//                left += 1
//            }
//            res = (res + dp[i]) % module
//        }
//        return res

//        let module = Int(1e9 + 7)
//        let arr = arr.sorted()
//        var memo: [Int : Int] = [:]
//        for i in 0..<arr.count {
//            memo[arr[i]] = 1
//            for j in 0..<i {
//                let q = arr[i] / arr[j]
//                let r = arr[i] % arr[j]
//                if q < arr[j] {
//                    break
//                }
//                if r == 0 && memo[q] != nil {
//                    if arr[j] == q {
//                        memo[arr[i], default: 0] += memo[q]! * memo[arr[j], default: 0]
//                    } else {
//                        memo[arr[i], default: 0] += 2 * memo[q]! * memo[arr[j], default: 0]
//                    }
//                }
//            }
//        }
//        var res: Int = 0
//        for (_, v) in memo {
//            res += v
//        }
//        return res % module

//        let module = Int(1e9 + 7)
//        let arr = arr.sorted()
//        var idx: [Int : Int] = [:]
//        for i in 0..<arr.count {
//            idx[arr[i]] = i
//        }
//        var memo: [Int] = Array(repeating: 0, count: arr.count)
//        var res: Int = 0
//        for i in 0..<arr.count {
//            res += dfs(i)
//        }
//
//        func dfs(_ i: Int) -> Int {
//            if memo[i] != 0 {
//                return memo[i]
//            }
//            var res: Int = 1
//            let val = arr[i]
//            for j in 0..<i {
//                if val % arr[j] == 0 && idx[val / arr[j]] != nil {
//                    res += dfs(j) * dfs(idx[val / arr[j]]!)
//                }
//            }
//            memo[i] = res
//            return res
//        }
//
//        return res % module

        let module = Int(1e9 + 7)
        let arr = arr.sorted()
        var idx: [Int: Int] = [:]
        for i in 0 ..< arr.count {
            idx[arr[i]] = i
        }
        var dp: [Int] = Array(repeating: 0, count: arr.count)
        var res = 0
        for i in 0 ..< arr.count {
            let val = arr[i]
            dp[i] = 1
            for j in 0 ..< i {
                let x = arr[j]
                if x * x > val {
                    break
                }
                if x * x == val {
                    dp[i] += dp[j] * dp[j]
                    break
                }
                if val % x == 0 && idx[val / x] != nil {
                    dp[i] += dp[j] * dp[idx[val / x]!] * 2
                }
            }
            res += dp[i]
        }
        return res % module
    }
}

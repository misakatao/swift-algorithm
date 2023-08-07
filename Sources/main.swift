//
//  main.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/1.
//

import Foundation

func measureTime(_ closure: () -> Void) -> TimeInterval {
    let startTime = DispatchTime.now().uptimeNanoseconds
    closure()
    let elapsedNanoSeconds = DispatchTime.now().uptimeNanoseconds - startTime
    return TimeInterval(Double(elapsedNanoSeconds) / 1_000_000)
}

func printJSON(_ obj: Any) {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        }
    } catch {
        print("Error converting to JSON: \(error)")
    }
}

let s = Solution()

func testCase_3() {
    print("耗时: \(measureTime { print(s.lengthOfLongestSubstring("abcabcbb")) }) ms")
}

func testCase_39() {
    print("耗时: \(measureTime { printJSON(s.combinationSum([10,1,2,7,6,1,5], 8)) }) ms")
}

func testCase_40() {
    print("耗时: \(measureTime { printJSON(s.combinationSum2([10,1,2,7,6,1,5], 8)) }) ms")
}

func testCase_46() {
    print("耗时: \(measureTime { printJSON(s.permute([1,3,5,7])) }) ms")
}

func testCase_51() {
    print("耗时: \(measureTime { printJSON(s.solveNQueens(8)) }) ms")
}

func testCase_77() {
    print("耗时: \(measureTime { printJSON(s.combine(4, 2)) }) ms")
}

func testCase_78() {
    print("耗时: \(measureTime { printJSON(s.subsets([1,2,3])) }) ms")
}

func testCase_314() {
    
}

func testCase_320() {
    
}

func testCase_322() {
    print("耗时: \(measureTime { print(s.coinChange([186,419,83,408], 6249)) }) ms")
}

func testCase_509() {
    print("耗时: \(measureTime { print(s.fib2(65)) }) ms")
    print("耗时: \(measureTime { print(s.fib1(65)) }) ms")
    print("耗时: \(measureTime { print(s.fib(65)) }) ms")
}

func testCase_543() {
    // 构造二叉树
    let root = TreeNode(1)
    root.left = TreeNode(2)
    root.right = TreeNode(3)
    root.left?.left = TreeNode(4)
    root.left?.right = TreeNode(5)
    root.right?.right = TreeNode(6)
    root.left?.left?.left = TreeNode(7)
    
    // 计算直径
    print("耗时: \(measureTime { print(s.diameterOfBinaryTree(root)) }) ms")
}

testCase_39()
testCase_40()

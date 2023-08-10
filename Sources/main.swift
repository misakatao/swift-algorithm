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

func readJSON(_ filePath: String) -> Any? {
    if let data = FileManager.default.contents(atPath: filePath) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
            return json
        } catch {
            print("Error parsing JSON: \(error)")
            return nil
        }
    } else {
        print("File data is empty.")
        return nil
    }
}

func printJSON(_ obj: Any) {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: obj, options: [.prettyPrinted])
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

func testCase_34() {
    let nums = [2,2]
    let target = 1
    print("耗时: \(measureTime { print(s.searchRange(nums, target)) }) ms")
}

func testCase_39() {
    let candidates = [10,1,2,7,6,1,5]
    let target = 8
    print("耗时: \(measureTime { printJSON(s.combinationSum(candidates, target)) }) ms")
}

func testCase_40() {
    let candidates = [10,1,2,7,6,1,5]
    let target = 8
    print("耗时: \(measureTime { printJSON(s.combinationSum2(candidates, target)) }) ms")
}

func testCase_42() {
    // [4,2,0,3,2,5]
    let heights = [0,1,0,2,1,0,1,3,2,1,2,1]
    print("耗时: \(measureTime { printJSON(s.trap(heights)) }) ms")
}

func testCase_46() {
    let nums = [1,3,5,7]
    print("耗时: \(measureTime { printJSON(s.permute(nums)) }) ms")
}

func testCase_51() {
    print("耗时: \(measureTime { printJSON(s.solveNQueens(8)) }) ms")
}

func testCase_76() {
    print("耗时: \(measureTime { print(s.minWindow("ADOBECODEBANC", "ABC")) }) ms")
}

func testCase_77() {
    print("耗时: \(measureTime { printJSON(s.combine(4, 2)) }) ms")
}

func testCase_78() {
    let nums = [1,2,3]
    print("耗时: \(measureTime { printJSON(s.subsets(nums)) }) ms")
}

func testCase_121() {
    let filePath = "/Users/misaka/Developer/121.json"
    let data = readJSON(filePath)
    if let prices = data as? Array<Int> {
        print("耗时: \(measureTime { print(s.maxProfit(prices)) }) ms")
    }
}

func testCase_122() {
    let filePath = "/Users/misaka/Developer/121.json"
    let data = readJSON(filePath)
    if let prices = data as? Array<Int> {
        print("耗时: \(measureTime { print(s.maxProfit2(prices)) }) ms")
    }
}

func testCase_322() {
    let coins = [186,419,83,408]
    let amount = 6249
    print("耗时: \(measureTime { print(s.coinChange(coins, amount)) }) ms")
}

func testCase_438() {
    print("耗时: \(measureTime { print(s.findAnagrams("cbaebabacd", "abc")) }) ms")
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

func testCase_567() {
    print("耗时: \(measureTime { print(s.checkInclusion("ab", "eidbaooo")) }) ms")
}

func testCase_752() {
    let deadends = ["0201","0101","0102","1212","2002"]
    let target = "0202"
    print("耗时: \(measureTime { print(s.openLock(deadends, target)) }) ms")
}

func testCase_1281() {
    print("耗时: \(measureTime { print(s.subtractProductAndSum(234)) }) ms")
}

//testCase_3()
//testCase_34()
//testCase_39()
//testCase_40()
testCase_42()
//testCase_46()
//testCase_51()
//testCase_76()
//testCase_77()
//testCase_78()
//testCase_121()
//testCase_322()
//testCase_438()
//testCase_509()
//testCase_543()
//testCase_567()
//testCase_752()
//testCase_1281()

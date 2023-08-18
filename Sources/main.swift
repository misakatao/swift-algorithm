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

func makeMaxInts() -> [Int] {
    let filePath = "/Users/misaka/Developer/121.json"
    let data = readJSON(filePath)
    if let prices = data as? Array<Int> {
        return prices
    } else {
        return []
    }
}

let s = Solution()

func testCase_2() {
    let head1 = ListNode(2)
    head1.next = ListNode(4)
    head1.next?.next = ListNode(3)
    
    let head2 = ListNode(5)
    head2.next = ListNode(6)
    head2.next?.next = ListNode(4)
    
    print("耗时: \(measureTime { print("示例1: \(s.addTwoNumbers(head1, head2)?.toString ?? "")") }) ms")
}

func testCase_3() {
    print("耗时: \(measureTime { print("示例1: \(s.lengthOfLongestSubstring("abcabcbb"))") }) ms")
}

func testCase_4() {
    print("耗时: \(measureTime { print("示例1: \(s.findMedianSortedArrays([1,3], [2]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.findMedianSortedArrays([1,2], [3,4]))") }) ms")
}

func testCase_11() {
    print("耗时: \(measureTime { print("示例1: \(s.maxArea([1,8,6,2,5,4,8,3,7]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxArea([1,1]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxArea(makeMaxInts()))") }) ms")
}

func testCase_23() {
    let head1 = ListNode(1)
    head1.next = ListNode(4)
    head1.next?.next = ListNode(5)
    
    let head2 = ListNode(1)
    head2.next = ListNode(3)
    head2.next?.next = ListNode(4)
    
    let head3 = ListNode(2)
    head3.next = ListNode(6)
    
    print("耗时: \(measureTime { print("示例1: \(s.mergeKLists([head1, head2, head3])?.toString ?? "")") }) ms")
}

func testCase_34() {
    let nums = [2,2]
    let target = 1
    print("耗时: \(measureTime { print("示例1: \(s.searchRange(nums, target))") }) ms")
}

func testCase_39() {
    let candidates = [10,1,2,7,6,1,5]
    let target = 8
    print("耗时: \(measureTime { printJSON("示例1: \(s.combinationSum(candidates, target))") }) ms")
}

func testCase_40() {
    let candidates = [10,1,2,7,6,1,5]
    let target = 8
    print("耗时: \(measureTime { printJSON("示例1: \(s.combinationSum2(candidates, target))") }) ms")
}

func testCase_42() {
    print("耗时: \(measureTime { print("示例1: \(s.trap([0,1,0,2,1,0,1,3,2,1,2,1]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.trap([4,2,0,3,2,5]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.trap(makeMaxInts()))") }) ms")
}

func testCase_46() {
    let nums = [1,3,5,7]
    print("耗时: \(measureTime { printJSON("示例1: \(s.permute(nums))") }) ms")
}

func testCase_51() {
    print("耗时: \(measureTime { printJSON("示例1: \(s.solveNQueens(8))") }) ms")
}

func testCase_76() {
    print("耗时: \(measureTime { print("示例1: \(s.minWindow("ADOBECODEBANC", "ABC"))") }) ms")
}

func testCase_77() {
    print("耗时: \(measureTime { printJSON("示例1: \(s.combine(4, 2))") }) ms")
}

func testCase_78() {
    let nums = [1,2,3]
    print("耗时: \(measureTime { printJSON("示例1: \(s.subsets(nums))") }) ms")
}

func testCase_121() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit([7,1,5,3,6,4]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit([7,6,4,3,1]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit(makeMaxInts()))") }) ms")
}

func testCase_122() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit2([7,1,5,3,6,4]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit2([1,2,3,4,5]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit2([7,6,4,3,1]))") }) ms")
    print("耗时: \(measureTime { print("示例4: \(s.maxProfit2(makeMaxInts()))") }) ms")
}

func testCase_123() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit3([3,3,5,0,0,3,1,4]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit3([1,2,3,4,5]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit3([7,6,4,3,1]))") }) ms")
    print("耗时: \(measureTime { print("示例4: \(s.maxProfit3(makeMaxInts()))") }) ms")
}

func testCase_188() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit4(2, [2,4,1]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit4(2, [3,2,6,5,0,3]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit4(2, makeMaxInts()))") }) ms")
}

func testCase_309() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit5([1,2,3,0,2]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit5([1]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit5(makeMaxInts()))") }) ms")
}

func testCase_322() {
    let coins = [186,419,83,408]
    let amount = 6249
    print("耗时: \(measureTime { print("示例1: \(s.coinChange(coins, amount))") }) ms")
}

func testCase_370() {
    print("耗时: \(measureTime { print("示例1: \(s.getModifiedArray(5, [[1,3,2], [2,4,3], [0,2,-2]]))") }) ms")
}

func testCase_438() {
    print("耗时: \(measureTime { print("示例1: \(s.findAnagrams("cbaebabacd", "abc"))") }) ms")
}

func testCase_509() {
    print("耗时: \(measureTime { print("示例1: \(s.fib2(65))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.fib1(65))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.fib(65))") }) ms")
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
    print("耗时: \(measureTime { print("示例1: \(s.diameterOfBinaryTree(root))") }) ms")
}

func testCase_567() {
    print("耗时: \(measureTime { print("示例1: \(s.checkInclusion("ab", "eidbaooo"))") }) ms")
}

func testCase_714() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit([1,3,2,8,4,9], 2))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit([1,3,7,5,10,3], 3))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit(makeMaxInts(), 5))") }) ms")
}

func testCase_752() {
    let deadends = ["0201","0101","0102","1212","2002"]
    let target = "0202"
    print("耗时: \(measureTime { print("示例1: \(s.openLock(deadends, target))") }) ms")
}

func testCase_798() {
    print("耗时: \(measureTime { print("示例1: \(s.bestRotation([2,3,1,4,0]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.bestRotation([1,3,0,2,4]))") }) ms")
}

func testCase_833() {
    print("耗时: \(measureTime { print("示例1: \(s.findReplaceString("abcd", [0,2], ["a","cd"], ["eee","ffff"]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.findReplaceString("vmokgggqzp", [3,5,1], ["kg","ggq","mo"], ["s","so","bfr"]))") }) ms")
}

func testCase_1094() {
    print("耗时: \(measureTime { print("示例1: \(s.carPooling([[2,1,5],[3,3,7]], 4))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.carPooling([[2,1,5],[3,3,7]], 5))") }) ms")
}

func testCase_1109() {
    print("耗时: \(measureTime { print("示例1: \(s.corpFlightBookings([[1,2,10],[2,3,20],[2,5,25]], 5))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.corpFlightBookings([[1,2,10],[2,2,15]], 2))") }) ms")
}

func testCase_1281() {
    print("耗时: \(measureTime { print("示例1: \(s.subtractProductAndSum(234))") }) ms")
}

func testCase_1388() {
    print("耗时: \(measureTime { print("示例1: \(s.maxSizeSlices([1,2,3,4,5,6]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxSizeSlices([8,9,8,6,1,1]))") }) ms")
}

func testCase_1444() {
    print("耗时: \(measureTime { print("示例1: \(s.ways(["A..","AAA","..."], 3))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.ways(["A..","AA.","..."], 3))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.ways2(["A..","A..","..."], 1))") }) ms")
}

func testCase_1572() {
    print("耗时: \(measureTime { print("示例1: \(s.diagonalSum([[1,2,3],[4,5,6],[7,8,9]]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.diagonalSum([[1,1,1,1], [1,1,1,1], [1,1,1,1], [1,1,1,1]]))") }) ms")
}

func testCase_1749() {
    print("耗时: \(measureTime { print("示例1: \(s.maxAbsoluteSum([1,-3,2,3,-4]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxAbsoluteSum([2,-5,1,-4,3,-2]))") }) ms")
}

func testCase_2682() {
    print("耗时: \(measureTime { print("示例1: \(s.circularGameLosers(5, 2))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.circularGameLosers(4, 4))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.circularGameLosers(5, 3))") }) ms")
}

//testCase_2()
//testCase_3()
//testCase_4()
//testCase_11()
//testCase_23()
//testCase_34()
//testCase_39()
//testCase_40()
//testCase_42()
//testCase_46()
//testCase_51()
//testCase_76()
//testCase_77()
//testCase_78()
//testCase_121()
//testCase_122()
//testCase_123()
//testCase_188()
//testCase_309()
//testCase_322()
//testCase_370()
//testCase_438()
//testCase_509()
//testCase_543()
//testCase_567()
//testCase_714()
//testCase_752()
testCase_798()
//testCase_833()
//testCase_1094()
//testCase_1109()
//testCase_1281()
//testCase_1388()
//testCase_1444()
//testCase_1572()
//testCase_1749()
//testCase_2682()

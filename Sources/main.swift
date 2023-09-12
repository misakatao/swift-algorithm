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

func makeMaxProfits() -> [Int] {
    let filePath = "/Users/misaka/Developer/max-profit.json"
    let data = readJSON(filePath)
    if let prices = data as? [Int] {
        return prices
    } else {
        return []
    }
}

func makeMaxRobbers() -> [Int] {
    let filePath = "/Users/misaka/Developer/house-robber.json"
    let data = readJSON(filePath)
    if let prices = data as? [Int] {
        return prices
    } else {
        return []
    }
}

func makeMaxSortArray() -> [Int] {
    let filePath = "/Users/misaka/Developer/sort-array.json"
    let data = readJSON(filePath)
    if let prices = data as? [Int] {
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
    print("耗时: \(measureTime { print("示例1: \(s.findMedianSortedArrays([1, 3], [2]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.findMedianSortedArrays([1, 2], [3, 4]))") }) ms")
}

func testCase_6() {
    print("耗时: \(measureTime { print("示例1: \(s.convert("PAYPALISHIRING", 3))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.convert("PAYPALISHIRING", 4))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.convert("AB", 1))") }) ms")
}

func testCase_11() {
    print("耗时: \(measureTime { print("示例1: \(s.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxArea([1, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxArea(makeMaxProfits()))") }) ms")
}

func testCase_15() {
    print("耗时: \(measureTime { print("示例1: \(s.threeSum([-1, 0, 1, 2, -1, -4]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.threeSum([0, 1, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.threeSum([0, 0, 0]))") }) ms")
    print("耗时: \(measureTime { print("示例4: \(s.threeSum([0, 3, 0, 1, 1, -1, -5, -5, 3, -3, -3, 0]))") }) ms")
}

func testCase_18() {
    print("耗时: \(measureTime { print("示例1: \(s.fourSum([1, 0, -1, 0, -2, 2], 0))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.fourSum([2, 2, 2, 2, 2], 8))") }) ms")
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

func testCase_28() {
    print("耗时: \(measureTime { print("示例1: \(s.strStr("sadbutsad", "sad"))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.strStr("leetcode", "leeto"))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.strStr("leetcaodeleetcbodeleetcode", "code"))") }) ms")
    print("耗时: \(measureTime { print("示例4: \(s.strStr("misakaleetcodetao", "code"))") }) ms")
}

func testCase_34() {
    print("耗时: \(measureTime { print("示例1: \(s.searchRange([5, 7, 7, 8, 8, 10], 8))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.searchRange([5, 7, 7, 8, 8, 10], 6))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.searchRange([], 0))") }) ms")
}

func testCase_39() {
    print("耗时: \(measureTime { printJSON("示例1: \(s.combinationSum([10, 1, 2, 7, 6, 1, 5], 8))") }) ms")
}

func testCase_40() {
    print("耗时: \(measureTime { printJSON("示例1: \(s.combinationSum2([10, 1, 2, 7, 6, 1, 5], 8))") }) ms")
}

func testCase_41() {
    print("耗时: \(measureTime { print("示例1: \(s.firstMissingPositive([1, 2, 0]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.firstMissingPositive([3, 4, -1, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.firstMissingPositive([7, 8, 9, 11, 12]))") }) ms")
}

func testCase_42() {
    print("耗时: \(measureTime { print("示例1: \(s.trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.trap([4, 2, 0, 3, 2, 5]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.trap(makeMaxProfits()))") }) ms")
}

func testCase_46() {
    print("耗时: \(measureTime { printJSON("示例1: \(s.permute([1, 3, 5, 7]))") }) ms")
}

func testCase_48() {
    var matrix1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    s.rotate(&matrix1)
    print("耗时: \(measureTime { print("示例1: \(matrix1)") }) ms")

    var matrix2 = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
    s.rotate(&matrix2)
    print("耗时: \(measureTime { print("示例1: \(matrix2)") }) ms")
}

func testCase_49() {
    print("耗时: \(measureTime { print("示例1: \(s.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.groupAnagrams([]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.groupAnagrams(["a"]))") }) ms")
    print("耗时: \(measureTime { print("示例4: \(s.groupAnagrams(["bdddddddddd", "bbbbbbbbbbc"]))") }) ms")
}

func testCase_51() {
    print("耗时: \(measureTime { printJSON("示例1: \(s.solveNQueens(8))") }) ms")
}

func testCase_54() {
    print("耗时: \(measureTime { print("示例1: \(s.spiralOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.spiralOrder([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]))") }) ms")
}

func testCase_55() {
    print("耗时: \(measureTime { print("示例1: \(s.canJump([2, 3, 1, 1, 4]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.canJump([3, 2, 1, 0, 4]))") }) ms")
}

func testCase_59() {
    print("耗时: \(measureTime { print("示例1: \(s.generateMatrix(3))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.generateMatrix(1))") }) ms")
}

func testCase_70() {
    print("耗时: \(measureTime { print("示例1: \(s.climbStairs(2))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.climbStairs(3))") }) ms")
}

func testCase_76() {
    print("耗时: \(measureTime { print("示例1: \(s.minWindow("ADOBECODEBANC", "ABC"))") }) ms")
}

func testCase_77() {
    print("耗时: \(measureTime { printJSON("示例1: \(s.combine(4, 2))") }) ms")
}

func testCase_78() {
    print("耗时: \(measureTime { printJSON("示例1: \(s.subsets([1, 2, 3]))") }) ms")
}

func testCase_97() {
    print("耗时: \(measureTime { print("示例1: \(s.isInterleave("aabcc", "dbbca", "aadbbcbcac"))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.isInterleave("aabcc", "dbbca", "aadbbbaccc"))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.isInterleave("", "", ""))") }) ms")
}

func testCase_105() {
    print("耗时: \(measureTime { print("示例1: \(s.buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])?.preSerialize ?? "")") }) ms")
    print("耗时: \(measureTime { print("示例1: \(s.buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])?.postSerialize ?? "")") }) ms")
}

func testCase_118() {
    print("耗时: \(measureTime { print("示例1: \(s.generate(5))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.generate(1))") }) ms")
}

func testCase_121() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit([7, 1, 5, 3, 6, 4]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit([7, 6, 4, 3, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit(makeMaxProfits()))") }) ms")
}

func testCase_122() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit2([7, 1, 5, 3, 6, 4]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit2([1, 2, 3, 4, 5]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit2([7, 6, 4, 3, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例4: \(s.maxProfit2(makeMaxProfits()))") }) ms")
}

func testCase_123() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit3([3, 3, 5, 0, 0, 3, 1, 4]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit3([1, 2, 3, 4, 5]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit3([7, 6, 4, 3, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例4: \(s.maxProfit3(makeMaxProfits()))") }) ms")
}

func testCase_128() {
    print("耗时: \(measureTime { print("示例1: \(s.longestConsecutive([100, 4, 200, 1, 3, 2]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]))") }) ms")
}

func testCase_151() {
    print("耗时: \(measureTime { print("示例1: \(s.reverseWords("the sky is blue"))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.reverseWords("  hello world  "))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.reverseWords("a good   example"))") }) ms")
}

func testCase_188() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit4(2, [2, 4, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit4(2, [3, 2, 6, 5, 0, 3]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit4(2, makeMaxProfits()))") }) ms")
}

func testCase_198() {
    print("耗时: \(measureTime { print("示例1: \(s.rob([1, 2, 3, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.rob([2, 7, 9, 3, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.rob([2, 1, 1, 2]))") }) ms")
    print("耗时: \(measureTime { print("示例4: \(s.rob(makeMaxRobbers()))") }) ms")
}

func testCase_213() {
    print("耗时: \(measureTime { print("示例1: \(s.rob2([2, 3, 2]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.rob2([1, 2, 3, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.rob2([1, 2, 3]))") }) ms")
    print("耗时: \(measureTime { print("示例4: \(s.rob2(makeMaxRobbers()))") }) ms")
}

func testCase_215() {
    print("耗时: \(measureTime { print("示例1: \(s.findKthLargest([3, 2, 1, 5, 6, 4], 2))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4))") }) ms")
}

func testCase_228() {
    print("耗时: \(measureTime { print("示例1: \(s.summaryRanges([0, 1, 2, 4, 5, 7]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.summaryRanges([0, 2, 3, 4, 6, 8, 9]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.summaryRanges([-1]))") }) ms")
}

func testCase_297() {
    let ser = Codec()
    let deser = Codec()
    let root = TreeNode(1)
    root.left = TreeNode(2)
    root.right = TreeNode(3)
    root.right?.left = TreeNode(4)
    root.right?.right = TreeNode(5)
    print("耗时: \(measureTime { print("示例1: \(ser.serialize(root))") }) ms")
    print("耗时: \(measureTime { print("示例1: \(deser.deserialize(ser.serialize(root))?.toString ?? "")") }) ms")
}

func testCase_309() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit5([1, 2, 3, 0, 2]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit5([1]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit5(makeMaxProfits()))") }) ms")
}

func testCase_315() {
    print("耗时: \(measureTime { print("示例1: \(s.countSmaller([5, 2, 6, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.countSmaller([-1]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.countSmaller([-1, -1]))") }) ms")
}

func testCase_316() {
    print("耗时: \(measureTime { print("示例1: \(s.removeDuplicateLetters("bcabc"))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.removeDuplicateLetters("cbacdcbc"))") }) ms")
}

func testCase_322() {
    print("耗时: \(measureTime { print("示例1: \(s.coinChange([186, 419, 83, 408], 6249))") }) ms")
}

func testCase_337() {
    let node1 = TreeNode(3)
    node1.left = TreeNode(2)
    node1.left?.right = TreeNode(3)

    node1.right = TreeNode(3)
    node1.right?.right = TreeNode(1)

    let node2 = TreeNode(3)
    node2.left = TreeNode(4)
    node2.left?.left = TreeNode(1)
    node2.left?.right = TreeNode(3)

    node2.right = TreeNode(5)
    node2.right?.right = TreeNode(1)

    print("耗时: \(measureTime { print("示例1: \(s.rob3(node1))") }) ms")
    print("耗时: \(measureTime { print("示例1: \(s.rob3(node2))") }) ms")
}

func testCase_370() {
    print("耗时: \(measureTime { print("示例1: \(s.getModifiedArray(5, [[1, 3, 2], [2, 4, 3], [0, 2, -2]]))") }) ms")
}

func testCase_380() {
    let tmp = RandomizedSet()
    print("耗时: \(measureTime { print("insert: \(tmp.insert(1))") }) ms")
    print("耗时: \(measureTime { print("remove: \(tmp.remove(2))") }) ms")
    print("耗时: \(measureTime { print("insert: \(tmp.insert(2))") }) ms")
    print("耗时: \(measureTime { print("getRandom: \(tmp.getRandom())") }) ms")
    print("耗时: \(measureTime { print("remove: \(tmp.remove(1))") }) ms")
    print("耗时: \(measureTime { print("insert: \(tmp.insert(2))") }) ms")
    print("耗时: \(measureTime { print("getRandom: \(tmp.getRandom())") }) ms")
}

func testCase_402() {
    print("耗时: \(measureTime { print("示例1: \(s.removeKdigits("1432219", 3))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.removeKdigits("10200", 1))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.removeKdigits("10", 1))") }) ms")
}

func testCase_410() {
    print("耗时: \(measureTime { print("示例1: \(s.splitArray([7, 2, 5, 10, 8], 2))") }) ms")
    print("耗时: \(measureTime { print("示例1: \(s.splitArray([1, 2, 3, 4, 5], 2))") }) ms")
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

func testCase_710() {
    let tmp = BlackRandomSolution(7, [2, 3, 5])
    print("耗时: \(measureTime { print("示例1: \(tmp.pick())") }) ms")
    print("耗时: \(measureTime { print("示例2: \(tmp.pick())") }) ms")
    print("耗时: \(measureTime { print("示例3: \(tmp.pick())") }) ms")
    print("耗时: \(measureTime { print("示例4: \(tmp.pick())") }) ms")
    print("耗时: \(measureTime { print("示例5: \(tmp.pick())") }) ms")
    print("耗时: \(measureTime { print("示例6: \(tmp.pick())") }) ms")
    print("耗时: \(measureTime { print("示例7: \(tmp.pick())") }) ms")
}

func testCase_714() {
    print("耗时: \(measureTime { print("示例1: \(s.maxProfit([1, 3, 2, 8, 4, 9], 2))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxProfit([1, 3, 7, 5, 10, 3], 3))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxProfit(makeMaxProfits(), 5))") }) ms")
}

func testCase_752() {
    print("耗时: \(measureTime { print("示例1: \(s.openLock(["0201", "0101", "0102", "1212", "2002"], "0202"))") }) ms")
}

func testCase_798() {
    print("耗时: \(measureTime { print("示例1: \(s.bestRotation([2, 3, 1, 4, 0]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.bestRotation([1, 3, 0, 2, 4]))") }) ms")
}

func testCase_823() {
    print("耗时: \(measureTime { print("示例1: \(s.numFactoredBinaryTrees([2, 4]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.numFactoredBinaryTrees([2, 4, 5, 10]))") }) ms")
}

func testCase_833() {
    print("耗时: \(measureTime { print("示例1: \(s.findReplaceString("abcd", [0, 2], ["a", "cd"], ["eee", "ffff"]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.findReplaceString("vmokgggqzp", [3, 5, 1], ["kg", "ggq", "mo"], ["s", "so", "bfr"]))") }) ms")
}

func testCase_849() {
    print("耗时: \(measureTime { print("示例1: \(s.maxDistToClosest([1, 0, 0, 0, 1, 0, 1]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxDistToClosest([1, 0, 0, 0]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.maxDistToClosest([0, 1]))") }) ms")
}

func testCase_870() {
    print("耗时: \(measureTime { print("示例1: \(s.advantageCount([2, 7, 11, 15], [1, 10, 4, 11]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.advantageCount([12, 24, 8, 32], [13, 25, 32, 11]))") }) ms")
}

func testCase_875() {
    print("耗时: \(measureTime { print("示例1: \(s.minEatingSpeed([3, 6, 7, 11], 8))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.minEatingSpeed([30, 11, 23, 4, 20], 5))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.minEatingSpeed([30, 11, 23, 4, 20], 6))") }) ms")
}

func testCase_878() {
    print("耗时: \(measureTime { print("示例1: \(s.nthMagicalNumber(1, 2, 3))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.nthMagicalNumber(4, 2, 3))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.nthMagicalNumber(6, 2, 3))") }) ms")
}

func testCase_912() {
//    print("耗时: \(measureTime { print("示例0: \(s.sortArray([]))") }) ms")
    print("耗时: \(measureTime { print("示例0: \(s.sortArray([2, 8, 3, 9, 4, 8, 4]))") }) ms")
//    print("耗时: \(measureTime { print("示例1: \(s.sortArray([5, 2, 3, 1]))") }) ms")
//    print("耗时: \(measureTime { print("示例2: \(s.sortArray([5, 1, 1, 2, 0, 0]))") }) ms")
//    print("耗时: \(measureTime { print("示例3: \(s.sortArray(makeMaxSortArray()))") }) ms")
}

func testCase_1011() {
    print("耗时: \(measureTime { print("示例1: \(s.shipWithinDays([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.shipWithinDays([3, 2, 2, 4, 1, 4], 3))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.shipWithinDays([1, 2, 3, 1, 1], 4))") }) ms")
}

func testCase_1094() {
    print("耗时: \(measureTime { print("示例1: \(s.carPooling([[2, 1, 5], [3, 3, 7]], 4))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.carPooling([[2, 1, 5], [3, 3, 7]], 5))") }) ms")
}

func testCase_1109() {
    print("耗时: \(measureTime { print("示例1: \(s.corpFlightBookings([[1, 2, 10], [2, 3, 20], [2, 5, 25]], 5))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.corpFlightBookings([[1, 2, 10], [2, 2, 15]], 2))") }) ms")
}

func testCase_1267() {
    print("耗时: \(measureTime { print("示例1: \(s.countServers([[1, 0], [0, 1]]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.countServers([[1, 0], [1, 1]]))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.countServers([[1, 1, 0, 0], [0, 0, 1, 0], [0, 0, 1, 0], [0, 0, 0, 1]]))") }) ms")
}

func testCase_1281() {
    print("耗时: \(measureTime { print("示例1: \(s.subtractProductAndSum(234))") }) ms")
}

func testCase_1388() {
    print("耗时: \(measureTime { print("示例1: \(s.maxSizeSlices([1, 2, 3, 4, 5, 6]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxSizeSlices([8, 9, 8, 6, 1, 1]))") }) ms")
}

func testCase_1444() {
    print("耗时: \(measureTime { print("示例1: \(s.ways(["A..", "AAA", "..."], 3))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.ways(["A..", "AA.", "..."], 3))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.ways2(["A..", "A..", "..."], 1))") }) ms")
}

func testCase_1572() {
    print("耗时: \(measureTime { print("示例1: \(s.diagonalSum([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.diagonalSum([[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]]))") }) ms")
}

func testCase_1654() {
    print("耗时: \(measureTime { print("示例1: \(s.minimumJumps([14, 4, 18, 1, 15], 3, 15, 9))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.minimumJumps([8, 3, 16, 6, 12, 20], 15, 13, 11))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.minimumJumps([1, 6, 2, 14, 5, 17, 4], 16, 9, 7))") }) ms")
}

func testCase_1749() {
    print("耗时: \(measureTime { print("示例1: \(s.maxAbsoluteSum([1, -3, 2, 3, -4]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.maxAbsoluteSum([2, -5, 1, -4, 3, -2]))") }) ms")
}

func testCase_1782() {
    print("耗时: \(measureTime { print("示例1: \(s.countPairs(4, [[1, 2], [2, 4], [1, 3], [2, 3], [2, 1]], [2, 3]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.countPairs(5, [[1, 5], [1, 5], [3, 4], [2, 5], [1, 3], [5, 1], [2, 3], [2, 5]], [1, 2, 3, 4, 5]))") }) ms")
}

func testCase_2187() {
    print("耗时: \(measureTime { print("示例1: \(s.minimumTime([1, 2, 3], 5))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.minimumTime([2], 1))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.minimumTime([5, 10, 10], 9))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.minimumTime([9, 3, 10, 5], 2))") }) ms")
}

func testCase_2237() {
    print("耗时: \(measureTime { print("示例1: \(s.canChange("_L__R__R_", "L______RR"))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.canChange("R_L_", "__LR"))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.canChange("_R", "R_"))") }) ms")
    print("耗时: \(measureTime { print("示例4: \(s.canChange("_L__R__R_L", "L______RR_"))") }) ms")
}

func testCase_2240() {
    print("耗时: \(measureTime { print("示例1: \(s.waysToBuyPensPencils(20, 10, 5))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.waysToBuyPensPencils(5, 10, 10))") }) ms")
}

func testCase_2439() {
    print("耗时: \(measureTime { print("示例1: \(s.minimizeArrayValue([3, 7, 1, 6]))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.minimizeArrayValue([10, 1]))") }) ms")
}

func testCase_2594() {
    print("耗时: \(measureTime { print("示例1: \(s.repairCars([4, 2, 3, 1], 10))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.repairCars([5, 1, 8], 6))") }) ms")
    print("耗时: \(measureTime { print("示例3: \(s.repairCars([31, 31, 5, 19, 19, 10, 31, 18, 19, 3, 16, 20, 4, 16, 2, 25, 10, 16, 23, 18, 21, 23, 28, 6, 7, 29, 11, 11, 19, 20, 24, 19, 26, 12, 29, 29, 1, 14, 17, 26, 24, 7, 11, 28, 22, 14, 31, 12, 3, 19, 16, 26, 11], 736185))") }) ms")
}

func testCase_2682() {
    print("耗时: \(measureTime { print("示例1: \(s.circularGameLosers(5, 2))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.circularGameLosers(4, 4))") }) ms")
    print("耗时: \(measureTime { print("示例2: \(s.circularGameLosers(5, 3))") }) ms")
}

// testCase_2()
// testCase_3()
// testCase_4()
// testCase_6()
// testCase_11()
// testCase_15()
// testCase_18()
// testCase_23()
// testCase_28()
// testCase_34()
// testCase_39()
// testCase_40()
// testCase_41()
// testCase_42()
// testCase_46()
// testCase_48()
// testCase_49()
// testCase_51()
// testCase_54()
// testCase_55()
// testCase_59()
// testCase_70()
// testCase_76()
// testCase_77()
// testCase_78()
// testCase_97()
// testCase_105()
// testCase_118()
// testCase_121()
// testCase_122()
// testCase_123()
// testCase_128()
// testCase_151()
// testCase_188()
// testCase_198()
// testCase_213()
testCase_215()
// testCase_228()
// testCase_297()
// testCase_309()
// testCase_315()
// testCase_316()
// testCase_322()
// testCase_337()
// testCase_370()
// testCase_380()
// testCase_402()
// testCase_410()
// testCase_438()
// testCase_509()
// testCase_543()
// testCase_567()
// testCase_710()
// testCase_714()
// testCase_752()
// testCase_798()
// testCase_823()
// testCase_833()
// testCase_849()
// testCase_870()
// testCase_875()
// testCase_878()
 testCase_912()
// testCase_1011()
// testCase_1094()
// testCase_1109()
// testCase_1267()
// testCase_1281()
// testCase_1388()
// testCase_1444()
// testCase_1572()
// testCase_1654()
// testCase_1749()
// testCase_1782()
// testCase_2187()
// testCase_2237()
// testCase_2240()
// testCase_2439()
// testCase_2594()
// testCase_2682()

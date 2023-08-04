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

let s = Solution()

func testCase_1() {
    
}

func testCase_5() {
    
}

func testCase_104() {
    
}

func testCase_144() {
    
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



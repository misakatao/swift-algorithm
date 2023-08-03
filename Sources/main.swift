//
//  main.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/1.
//

import Foundation

// 构造二叉树
let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.left?.right = TreeNode(5)
root.right?.right = TreeNode(6)
root.left?.left?.left = TreeNode(7)

// 计算直径
let result = Solution().diameterOfBinaryTree(root)
print(result) // 输出 4

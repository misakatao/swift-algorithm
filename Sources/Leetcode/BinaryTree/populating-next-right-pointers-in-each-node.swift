//
//  populating-next-right-pointers-in-each-node.swift
//  
//
//  Created by Misaka on 2023/12/29.
//

/**
 116. 填充每个节点的下一个右侧节点指针

 给定一个 完美二叉树 ，其所有叶子节点都在同一层，每个父节点都有两个子节点。二叉树定义如下：

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 填充它的每个 next 指针，让这个指针指向其下一个右侧节点。如果找不到下一个右侧节点，则将 next 指针设置为 NULL。

 初始状态下，所有 next 指针都被设置为 NULL。
 */

import Foundation
import Utils

class Node {
    var val: Int = 0
    var left: Node?
    var right: Node?
    var next: Node?
    init(val: Int, left: Node? = nil, right: Node? = nil, next: Node? = nil) {
        self.val = val
        self.left = left
        self.right = right
        self.next = next
    }
}

@main
class Solution {
    
    func connect(_ root: Node?) -> Node? {
        if root == nil {
            return root
        }
        // 解法一
//        var queue: [Node] = []
//        queue.append(root!)
//        while !queue.isEmpty {
//            let size = queue.count
//            var pre: Node? = queue.first
//            for i in 1 ..< size {
//                pre?.next = queue[i]
//                pre = queue[i]
//            }
//            for _ in 0 ..< size {
//                let tmp = queue.removeFirst()
//                if let left = tmp.left {
//                    queue.append(left)
//                }
//                if let right = tmp.right {
//                    queue.append(right)
//                }
//            }
//        }
        
        // 解法二
//        var pre: Node? = root
//        while pre?.left != nil {
//            var tmp = pre
//            while tmp != nil {
//                tmp?.left?.next = tmp?.right
//                if tmp?.next != nil {
//                    tmp?.right?.next = tmp?.next?.left
//                }
//                tmp = tmp?.next
//            }
//            pre = pre?.left
//        }
        dfs(root)
        return root
    }
    
    func dfs(_ node: Node?) {
        if node == nil {
            return
        }
        
        var left = node?.left
        var right = node?.right
        while left != nil {
            left?.next = right
            left = left?.right
            right = right?.left
        }
        dfs(node?.left)
        dfs(node?.right)
    }
    
    func traverse(_ left: Node?, _ right: Node?) {
        if left == nil || right == nil {
            return
        }
        left?.next = right
        traverse(left?.left, left?.right)
        traverse(right?.left, right?.right)
        traverse(left?.right, right?.left)
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let node = Node(val: 1,
                            left: Node(val: 2,
                                       left: Node(val: 4,
                                                  left: nil,
                                                  right: nil,
                                                  next: nil),
                                       right: Node(val: 5,
                                                   left: nil,
                                                   right: nil,
                                                   next: nil),
                                       next: nil),
                            right: Node(val: 3,
                                        left: Node(val: 6,
                                                   left: nil,
                                                   right: nil,
                                                   next: nil),
                                        right: Node(val: 7,
                                                    left: nil,
                                                    right: nil,
                                                    next: nil),
                                        next: nil),
                            next: nil)
            print("示例1: \(String(describing: s.connect(node)))")
        }
    }
}

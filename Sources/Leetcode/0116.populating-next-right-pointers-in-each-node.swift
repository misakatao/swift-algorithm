//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/28.
//
//  填充每个节点的下一个右侧节点指针

import Foundation

extension Solution {
    /*
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
    func connect(_ root: Node?) -> Node? {
//        func traverse(_ left: Node?, _ right: Node?) {
//            if left == nil && right == nil {
//                return
//            }
//            left?.next = right
//            traverse(left?.left, left?.right)
//            traverse(right?.left, right?.right)
//            traverse(left?.right, right?.left)
//        }
//        traverse(root?.left, root?.right)
//        return root
//        guard let root = root else { return nil }
//        var queue: [Node?] = []
//        queue.append(root)
//        while !queue.isEmpty {
//            let sz = queue.count
//            for i in 0..<sz {
//                let cur = queue.removeFirst()
//                if i < sz - 1 {
//                    cur?.next = queue[0]
//                }
//                if let left = cur?.left {
//                    queue.append(left)
//                }
//                if let right = cur?.right {
//                    queue.append(right)
//                }
//            }
//        }
//        return root
        
        func dfs(_ node: Node?) {
            guard let node = node else { return }
            let left = node.left
            let right = node.right
            left?.next = right
            right?.next = node.next?.left
            dfs(node.left)
            dfs(node.right)
        }
        dfs(root)
        return root
    }
}

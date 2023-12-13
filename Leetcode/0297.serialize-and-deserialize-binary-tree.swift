//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/30.
//
//  二叉树的序列化与反序列化

import Foundation

class Codec {
    /*
     序列化是将一个数据结构或者对象转换为连续的比特位的操作，进而可以将转换后的数据存储在一个文件或者内存中，同时也可以通过网络传输到另一个计算机环境，采取相反方式重构得到原数据。

     请设计一个算法来实现二叉树的序列化与反序列化。这里不限定你的序列 / 反序列化算法执行逻辑，你只需要保证一个二叉树可以被序列化为一个字符串并且将这个字符串反序列化为原始的树结构。

     提示: 输入输出格式与 LeetCode 目前使用的方式一致，详情请参阅 LeetCode 序列化二叉树的格式。你并非必须采取这种方式，你也可以采用其他的方法解决这个问题。
     */
    func serialize(_ root: TreeNode?) -> String {
        var strings: [String] = []
//        func traverse(_ node: TreeNode?) {
//            guard let node = node else {
//                strings.append("null")
//                return
//            }
//            // 前序遍历
//            // strings.append("\(node.val)")
//            traverse(node.left)
//            traverse(node.right)
//            // 后序遍历
//            strings.append("\(node.val)")
//        }
//        traverse(root)
//        return strings.joined(separator: ",")
        
        guard let root = root else { return "" }
        var queue: [TreeNode?] = [root]
        while !queue.isEmpty {
            let sz = queue.count
            for _ in 0 ..< sz {
                let cur = queue.removeFirst()
                if cur == nil {
                    strings.append("null")
                    continue
                }
                strings.append("\(cur?.val ?? 0)")
                queue.append(cur?.left)
                queue.append(cur?.right)
            }
        }
        return strings.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty { return nil }
        let nodes = data.split(separator: ",")
//        func traverse(_ nodes: inout [Substring]) -> TreeNode? {
//            if nodes.isEmpty { return nil }
//            // 前序遍历
////            let rootVal = nodes.removeFirst()
////            if rootVal == "null" { return nil }
////            let root = TreeNode(Int(rootVal) ?? 0)
////            root.left = traverse(&nodes)
////            root.right = traverse(&nodes)
//
//            // 后序遍历
//            let rootVal = nodes.removeLast()
//            if rootVal == "null" { return nil }
//            let root = TreeNode(Int(rootVal) ?? 0)
//            root.right = traverse(&nodes)
//            root.left = traverse(&nodes)
//
//            return root
//        }
//        return traverse(&nodes)
        
        let root = TreeNode(Int(nodes[0]) ?? 0)
        var queue: [TreeNode?] = [root]
        var index = 1
        while !queue.isEmpty {
            let sz = queue.count
            for _ in 0 ..< sz {
                let cur = queue.removeFirst()
                // 为父节点构造左侧子节点
                let left = nodes[index]
                index += 1
                if left != "null" {
                    cur?.left = TreeNode(Int(left) ?? 0)
                    queue.append(cur?.left)
                }
                let right = nodes[index]
                index += 1
                if right != "null" {
                    cur?.right = TreeNode(Int(right) ?? 0)
                    queue.append(cur?.right)
                }
            }
        }
        return root
    }
}

//
//  TreeNode.swift
//  
//
//  Created by Misaka on 2023/12/11.
//

import Foundation

public class TreeNode {
    public var val: Int // 节点值
    public var left: TreeNode? // 左子节点引用
    public var right: TreeNode? // 右子节点引用
    public var height: Int = 0 // 节点高度
    
    public static func serialize(_ root: TreeNode?) -> [Int?] {
        guard let root = root else { return [] }
        
        var result: [Int?] = []
        var queue: [TreeNode?] = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if let node = node {
                result.append(node.val)
                queue.append(node.left)
                queue.append(node.right)
            } else {
                result.append(nil)
            }
        }
        
        // 移除末尾的nil
        while let last = result.last, last == nil {
            result.removeLast()
        }
        
        return result
    }

    public static func fromArray(_ array: [Any?]) -> TreeNode? {
        guard !array.isEmpty, let firstVal = array[0] as? Int else { return nil }
        
        let root = TreeNode(firstVal)
        var queue: [TreeNode] = [root]
        var i = 1
        
        while i < array.count && !queue.isEmpty {
            let node = queue.removeFirst()
            
            // Set left child
            if i < array.count {
                if let val = array[i] as? Int {
                    node.left = TreeNode(val)
                    queue.append(node.left!)
                }
                i += 1
            }
            
            // Set right child
            if i < array.count {
                if let val = array[i] as? Int {
                    node.right = TreeNode(val)
                    queue.append(node.right!)
                }
                i += 1
            }
        }
        
        return root
    }

    public static func createBinaryTree(_ array: [Int?]) -> TreeNode? {
        guard !array.isEmpty, let firstVal = array[0] else { return nil }
        
        let root = TreeNode(firstVal)
        var queue: [TreeNode] = [root]
        var i = 1
        
        while i < array.count && !queue.isEmpty {
            let node = queue.removeFirst()
            
            // Set left child
            if i < array.count {
                if let val = array[i] {
                    node.left = TreeNode(val)
                    queue.append(node.left!)
                }
                i += 1
            }
            
            // Set right child
            if i < array.count {
                if let val = array[i] {
                    node.right = TreeNode(val)
                    queue.append(node.right!)
                }
                i += 1
            }
        }
        
        return root
    }

    public init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    public var toString: String {
        var res: [String] = []
        var queue: [TreeNode?] = []
        queue.append(self)
        while !queue.isEmpty {
            let sz = queue.count
            for _ in 0 ..< sz {
                let node = queue.removeFirst()
                if node == nil {
                    res.append("null")
                    continue
                }
                if let val = node?.val {
                    res.append("\(val)")
                }
                queue.append(node?.left)
                queue.append(node?.right)
            }
        }
        return "[\(res.joined(separator: ","))]"
    }
    
    public var preSerialize: String {
        var strings: [String] = []
        preSerialize(self, &strings)
        return "[" + strings.joined(separator: ",") + "]"
    }

    public var postSerialize: String {
        var strings: [String] = []
        postSerialize(self, &strings)
        return "[" + strings.joined(separator: ",") + "]"
    }
    
    private func preSerialize(_ node: TreeNode?, _ strings: inout [String]) {
        guard let node = node else {
            strings.append("null")
            return
        }
        strings.append("\(node.val)")
        preSerialize(node.left, &strings)
        preSerialize(node.right, &strings)
    }

    private func postSerialize(_ node: TreeNode?, _ strings: inout [String]) {
        guard let node = node else {
            strings.append("null")
            return
        }
        postSerialize(node.left, &strings)
        postSerialize(node.right, &strings)
        strings.append("\(node.val)")
    }
    
    // 二叉树的数组表示：
    // [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    // 二叉树的链表表示：
    //             /——— 15
    //         /——— 7
    //     /——— 3
    //    |    \——— 6
    //    |        \——— 12
    // ——— 1
    //     \——— 2
    //        |    /——— 9
    //         \——— 4
    //             \——— 8
    
    /// 将列表反序列化为二叉树：递归
    private static func listToTreeDFS<T: Comparable>(_ arr: [T?], i: Int) -> TreeNode? {
        if i < 0 || i >= arr.count || arr[i] == nil {
            return nil
        }
        let root = TreeNode(arr[i] as! Int)
        root.left = listToTreeDFS(arr, i: 2 * i + 1)
        root.right = listToTreeDFS(arr, i: 2 * i + 2)
        return root
    }
    
    /// 将列表反序列化为二叉树
    public static func listToTree<T: Comparable>(_ arr: [T?]) -> TreeNode? {
        listToTreeDFS(arr, i: 0)
    }
    
    /// 将二叉树序列化为列表：递归
    private static func treeToListDFS(_ root: TreeNode?, i: Int, res: inout [Int?]) {
        if root == nil {
            return
        }
        while i >= res.count {
            res.append(nil)
        }
        res[i] = root?.val
        treeToListDFS(root?.left, i: 2 * i + 1, res: &res)
        treeToListDFS(root?.right, i: 2 * i + 2, res: &res)
    }
    
    /// 将二叉树序列化为列表
    public static func treeToList(_ root: TreeNode?) -> [Int?] {
        var res: [Int?] = []
        treeToListDFS(root, i: 0, res: &res)
        return res
    }
}

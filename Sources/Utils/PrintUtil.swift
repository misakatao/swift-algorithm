//
//  PrintUtil.swift
//  
//
//  Created by Misaka on 2023/12/11.
//

import Foundation

public enum PrintUtil {
    
    private class Trunk {
        var prev: Trunk?
        var str: String
        
        init(prev: Trunk?, str: String) {
            self.prev = prev
            self.str = str
        }
    }
    
    public static func printLinkedList(_ head: ListNode) {
        var head: ListNode? = head
        var list: [String] = []
        while head != nil {
            list.append("\(head!.val)")
            head = head?.next
        }
        print(list.joined(separator: " -> "))
    }
    
    public static func printTree(_ root: TreeNode?) {
        printTree(root, nil, isRight: false)
    }
    
    private static func printTree(_ root: TreeNode?, _ prev: Trunk?, isRight: Bool) {
        if root == nil {
            return
        }
        
        var prevStr = "    "
        let trunk = Trunk(prev: prev, str: prevStr)
        
        printTree(root?.right, trunk, isRight: true)
        
        if prev == nil {
            trunk.str = "———"
        } else if isRight {
            trunk.str = "/———"
            prevStr = "   |"
        } else {
            trunk.str = "\\———"
            prev?.str = prevStr
        }
        
        showTrunks(trunk)
        print(" \(root!.val)")
        
        if prev != nil {
            prev?.str = prevStr
        }
        trunk.str = "   |"
        
        printTree(root?.left, trunk, isRight: false)
    }
    
    private static func showTrunks(_ p: Trunk?) {
        if p == nil {
            return
        }
        
        showTrunks(p?.prev)
        print(p!.str, terminator: "")
    }
    
    public static func printHashMap<K, V>(_ map: [K: V]) {
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
    }
    
    public static func printHeap<T: Comparable>(_ queue: [T]) {
        print("堆的数组表示：", terminator: "")
        print(queue)
        print("堆的树状表示：")
        let root = TreeNode.listToTree(queue)
        printTree(root)
    }
    
    public static func printMatrix<T>(_ matrix: [[T]]) {
        print("[")
        for row in matrix {
            print("  \(row),")
        }
        print("]")
    }
}

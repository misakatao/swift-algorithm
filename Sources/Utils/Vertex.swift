//
//  File.swift
//  
//
//  Created by Misaka on 2023/12/13.
//

import Foundation

public class Vertex : Hashable {
    
    public var val: Int
    
    public init(_ val: Int) {
        self.val = val
    }
    
    /// 输入值列表 vals ，返回顶点列表 vets
    public static func valsToVets(_ vals: [Int]) -> [Vertex] {
        return vals.map { Vertex($0) }
    }
    
    /// 输入顶点列表 vets ，返回值列表 vals
    public static func vetsToVals(_ vets: [Vertex]) -> [Int] {
        return vets.map { $0.val }
    }
    
    public static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        lhs.val == rhs.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
    
}

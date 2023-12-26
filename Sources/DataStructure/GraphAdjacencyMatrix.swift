//
//  GraphAdjacencyMatrix.swift
//  
//
//  Created by Misaka on 2023/12/13.
//

/**
 基于邻接矩阵实现的无向图类
 */

import Foundation
import Utils

public class GraphAdjacencyMatrix {
    
    private var vertices: [Int] // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
    
    private var adjacencyMatrix: [[Int]] // 邻接矩阵，行列索引对应“顶点索引”
    
    init(_ vertices: [Int], _ edges: [[Int]]) {
        self.vertices = []
        self.adjacencyMatrix = []
        
        for val in vertices {
            addVertex(val)
        }
        
        for e in edges {
            addEdge(e[0], e[1])
        }
    }
    
    /// 获取顶点数量
    public var size: Int {
        vertices.count
    }
    
    /// 添加顶点
    public func addVertex(_ val: Int) {
        vertices.append(val)
        
        let newRow = Array(repeating: 0, count: size)
        adjacencyMatrix.append(newRow)
        for i in adjacencyMatrix.indices {
            adjacencyMatrix[i].append(0)
        }
    }
    
    /// 删除顶点
    public func removeVertex(_ index: Int) {
        if index >= size {
            fatalError("index is out of bounds")
        }
        vertices.remove(at: index)
        
        adjacencyMatrix.remove(at: index)
        for i in adjacencyMatrix.indices {
            adjacencyMatrix[i].remove(at: index)
        }
    }
    
    /// 添加边
    /// 参数 i, j 对应 vertices 元素索引
    public func addEdge(_ i: Int, _ j: Int) {
        if i < 0 || j < 0 || i >= size || j >= size || i == j {
            fatalError("index is out of bounds")
        }
        adjacencyMatrix[i][j] = 1
        adjacencyMatrix[j][i] = 1
    }
    
    /// 删除边
    /// 参数 i, j 对应 vertices 元素索引
    public func removeEdge(_ i: Int, _ j: Int) {
        if i < 0 || j < 0 || i >= size || j >= size || i == j {
            fatalError("index is out of bounds")
        }
        adjacencyMatrix[i][j] = 0
        adjacencyMatrix[j][i] = 0
    }
    
    public func print() {
        Swift.print("顶点列表 = ", terminator: "")
        Swift.print(vertices)
        Swift.print("邻接矩阵 =")
        PrintUtil.printMatrix(adjacencyMatrix)
    }
}

@main
class Solution {
    
    static func main() {
        /* 初始化无向图 */
        // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
        let vertices = [1, 3, 2, 5, 4]
        let edges = [[0, 1], [1, 2], [2, 3], [0, 3], [2, 4], [3, 4]]
        let graph = GraphAdjacencyMatrix(vertices, edges)
        print("\n初始化后，图为")
        graph.print()

        /* 添加边 */
        // 顶点 1, 2 的索引分别为 0, 2
        graph.addEdge(0, 2)
        print("\n添加边 1-2 后，图为")
        graph.print()

        /* 删除边 */
        // 顶点 1, 3 的索引分别为 0, 1
        graph.removeEdge(0, 1)
        print("\n删除边 1-3 后，图为")
        graph.print()

        /* 添加顶点 */
        graph.addVertex(6)
        print("\n添加顶点 6 后，图为")
        graph.print()

        /* 删除顶点 */
        // 顶点 3 的索引为 1
        graph.removeVertex(1)
        print("\n删除顶点 3 后，图为")
        graph.print()
    }
}

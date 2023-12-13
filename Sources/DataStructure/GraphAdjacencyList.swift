//
//  GraphAdjacencyList.swift
//  
//
//  Created by Misaka on 2023/12/13.
//

/**
 基于邻接表实现的无向图类
 */

import Utils

public class GraphAdjacencyList {
    
    public private(set) var adjacencyList: [Vertex: [Vertex]]
    
    init(_ edges: [[Vertex]]) {
        self.adjacencyList = [:]
        for edge in edges {
            addVertex(edge[0])
            addVertex(edge[1])
            addEdge(edge[0], edge[1])
        }
    }
    
    /// 获取顶点数量
    public var size: Int {
        adjacencyList.count
    }
    
    /// 添加边
    public func addEdge(_ vet1: Vertex, _ vet2: Vertex) {
        if adjacencyList[vet1] == nil || adjacencyList[vet2] == nil || vet1 == vet2 {
            fatalError("params error")
        }
        adjacencyList[vet1]?.append(vet2)
        adjacencyList[vet2]?.append(vet1)
    }
    
    /// 删除边
    public func removeEdge(_ vet1: Vertex, _ vet2: Vertex) {
        if adjacencyList[vet1] == nil || adjacencyList[vet2] == nil || vet1 == vet2 {
            fatalError("params error")
        }
        adjacencyList[vet1]?.removeAll(where: { $0 == vet1 })
        adjacencyList[vet2]?.removeAll(where: { $0 == vet2 })
    }
    
    /// 添加顶点
    public func addVertex(_ vet: Vertex) {
        if adjacencyList[vet] != nil {
            return
        }
        adjacencyList[vet] = []
    }
    
    /// 删除顶点
    public func removeVertex(_ vet: Vertex) {
        if adjacencyList[vet] == nil {
            fatalError("params error")
        }
        adjacencyList.removeValue(forKey: vet)
        for key in adjacencyList.keys {
            adjacencyList[key]?.removeAll(where: { $0 == vet })
        }
    }
    
    public func print() {
        Swift.print("邻接表 =")
        for pair in adjacencyList {
            let tmp = pair.value.map { $0.val }
            Swift.print("\(pair.key.val): \(tmp),")
        }
    }
    
    /// 广度优先遍历 BFS
    /// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    public static func graphBFS(_ graph: GraphAdjacencyList, _ startVet: Vertex) -> [Vertex] {
        var res: [Vertex] = []
        var visited: Set<Vertex> = [startVet]
        var queue: [Vertex] = [startVet]
        while !queue.isEmpty {
            let vet = queue.removeFirst()
            res.append(vet)
            for adjVet in graph.adjacencyList[vet] ?? [] {
                if visited.contains(adjVet) {
                    continue
                }
                queue.append(adjVet)
                visited.insert(adjVet)
            }
        }
        return res
    }
    
    /// 深度优先遍历 DFS
    public static func graphDFS(_ graph: GraphAdjacencyList, _ startVet: Vertex) -> [Vertex] {
        var res: [Vertex] = []
        var visited: Set<Vertex> = [startVet]
        dfs(graph, &visited, &res, startVet)
        return res
    }
    
    private static func dfs(_ graph: GraphAdjacencyList, _ visited: inout Set<Vertex>, _ res: inout [Vertex], _ vet: Vertex) {
        res.append(vet)
        visited.insert(vet)
        for adjVet in graph.adjacencyList[vet] ?? [] {
            if visited.contains(adjVet) {
                continue
            }
            dfs(graph, &visited, &res, adjVet)
        }
    }
}

@main
class Solution {
    
    static func testMain() {
        /* 初始化无向图 */
        let v = Vertex.valsToVets([1, 3, 2, 5, 4])
        let edges = [[v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[2], v[3]], [v[2], v[4]], [v[3], v[4]]]
        let graph = GraphAdjacencyList(edges)
        print("\n初始化后，图为")
        graph.print()
        
        /* 添加边 */
        // 顶点 1, 2 即 v[0], v[2]
        graph.addEdge(v[0], v[2])
        print("\n添加边 1-2 后，图为")
        graph.print()
        
        /* 删除边 */
        // 顶点 1, 3 即 v[0], v[1]
        graph.removeEdge(v[0], v[1])
        print("\n删除边 1-3 后，图为")
        graph.print()
        
        /* 添加顶点 */
        let v5 = Vertex(6)
        graph.addVertex(v5)
        print("\n添加顶点 6 后，图为")
        graph.print()
        
        /* 删除顶点 */
        // 顶点 3 即 v[1]
        graph.removeVertex(v[1])
        print("\n删除顶点 3 后，图为")
        graph.print()
    }
    
    static func testBFS() {
        /* 初始化无向图 */
        let v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]], [v[1], v[4]],
            [v[2], v[5]], [v[3], v[4]], [v[3], v[6]], [v[4], v[5]],
            [v[4], v[7]], [v[5], v[8]], [v[6], v[7]], [v[7], v[8]],
        ]
        let graph = GraphAdjacencyList(edges)
        print("\n初始化后，图为")
        graph.print()
        
        /* 广度优先遍历 BFS */
        let res = GraphAdjacencyList.graphBFS(graph, v[0])
        print("\n广度优先遍历（BFS）顶点序列为")
        print(Vertex.vetsToVals(res))
    }
    
    static func testDFS() {
        /* 初始化无向图 */
        let v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6])
        let edges = [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ]
        let graph = GraphAdjacencyList(edges)
        print("\n初始化后，图为")
        graph.print()
        
        /* 深度优先遍历 DFS */
        let res = GraphAdjacencyList.graphDFS(graph, v[0])
        print("\n深度优先遍历（DFS）顶点序列为")
        print(Vertex.vetsToVals(res))
    }
    
    static func main() {
        testMain()
        
        testBFS()
        
        testDFS()
    }
}

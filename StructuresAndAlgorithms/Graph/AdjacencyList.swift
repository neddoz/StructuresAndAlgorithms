//
//  AdjacencyList.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 19/11/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

open class AdjacencyList<T: Hashable> {

    public var adjacencyDict: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}

    fileprivate func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge<T>(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }

    fileprivate func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    public func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }
        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }
        return nil
    }
}

extension AdjacencyList: Graphable {
    public typealias Element = T

    public var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            let lastIndex = edges.count - 1
            for (index, value) in edges.enumerated() {
                if index != lastIndex {
                    edgeString += "\(value.destination),"
                } else {
                    edgeString += "\(value.destination)"
                }
            }
            edgeString = "\(vertex)---> [\(edgeString)]\n"
            result.append(edgeString)
        }
        return result
    }
    
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex<T>(data: data)
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        return vertex
    }
    
    public func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(vertices: (source, destination), weight: weight)
        }
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }
}

// MARK: 1
extension Double
{
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

public func log10(_ value: Double)-> Double {
    return log2(value)/log2(10)
}

public func solution(_ N : Int) -> Int {
    if N < 10 {return 0}
    let value = log10(Double(N))
    let flooredValue = value.truncate(places: 0)
    return Int(pow(10, flooredValue))
}




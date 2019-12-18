//
//  DepthFirstSearch.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 19/11/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

final class DepthFirstSearch {
    
    static func depthFirstSearch<T: Equatable>(from start: Vertex<T>,
                                               to destination: Vertex<T>,
                                               graph: AdjacencyList<T>)-> Stack<Vertex<T>> {
        var visited = Set<Vertex<T>>()
        var stack = Stack<Vertex<T>>()

        stack.push(start)
        visited.insert(start)

        outer: while let vertex = stack.peek(), vertex != destination {
            
            guard let neighbors = graph.edges(from: vertex), neighbors.count > 0 else {
                print("backtrack from \(vertex)")
                stack.pop()
                continue
            }
            
            for edge in neighbors {
                if !visited.contains(edge.destination) {
                    visited.insert(edge.destination)
                    stack.push(edge.destination)
                    print(stack.description)
                    continue outer
                }
            }
            
            print("backtrack from \(vertex)")
            stack.pop()
        }

        return stack
    }
}

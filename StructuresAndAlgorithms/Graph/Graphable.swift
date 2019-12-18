//
//  Graphable.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 19/11/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

public protocol Graphable {
    
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }
    
    func createVertex(data: Element)-> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}

//
//  Vertex.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 19/11/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

public struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(data)")
    }
    
    static public func ==(lhs: Vertex, rhs: Vertex)-> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}

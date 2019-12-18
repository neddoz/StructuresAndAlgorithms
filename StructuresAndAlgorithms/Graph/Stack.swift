//
//  Stack.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 19/11/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

struct Stack<Element: Equatable> {
    
    fileprivate var array: [Element] = []
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    @discardableResult mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        let stackElements = array.reversed().map{"\($0)"}.joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

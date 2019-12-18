//
//  BinaryTreeStructure.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 14/11/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

class BinaryTreeStructure<T: Comparable> {
    
    private (set) public var value: T
    private (set) public var parent: BinaryTreeStructure?
    private (set) public var left: BinaryTreeStructure?
    private (set) public var right: BinaryTreeStructure?
    
    init(_ value: T) {
        self.value = value
    }
    
    public convenience init(_ list: [T]) {
        precondition(list.count > 0)
        self.init(list.first!)
        for value in list.dropFirst() {
            insert(value)
        }
    }

    public func isRoot()-> Bool {
        return parent == nil
    }
    
    public func isLeaf()-> Bool {
        return left == nil && right == nil
    }
    
    public func isLeftChild()-> Bool {
        return parent?.left === self
    }
    
    public func isRightChild()-> Bool {
        return parent?.right === self
    }
    
    public func hasLeftChild()-> Bool {
        return left != nil
    }
    
    public func hasRightChild()-> Bool {
        return right != nil
    }
    
    public func hasAnyChild()-> Bool {
        return hasLeftChild() || hasRightChild()
    }
    
    public func hasBothCildren()-> Bool {
        return hasLeftChild() && hasRightChild()
    }
    
    // inserting a node in the tree
    public func insert(_ value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value)
            } else {
                left = BinaryTreeStructure(value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value)
            } else {
                right = BinaryTreeStructure(value)
                right?.parent = self
            }
        }
    }
    
    public func search(_ element: T)-> BinaryTreeStructure? {
        var node: BinaryTreeStructure? = self
        while let n = node {
            if element < n.value {
                node = n.left
            } else if element > n.value {
                node = n.right
            } else {
                return n
            }
        }
        return node
    }
    
    @discardableResult public func remove()-> BinaryTreeStructure? {
//        var replacement: BinaryTreeStructure?
        return nil
    }
    
    // MARK:- Helper functions
    private func reconnectParentTo(node: BinaryTreeStructure?) {
        if let parent = parent {
            if isLeftChild() {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    public func minimum() -> BinaryTreeStructure {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinaryTreeStructure {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
}

extension BinaryTreeStructure: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

// MARK:- Traversals
extension BinaryTreeStructure {

    public func traverseInOder(_ process: (T)-> Void) {
        left?.traverseInOder(process)
        process(value)
        right?.traverseInOder(process)
    }
    
    public func traversePostOrder(_ process: (T)-> Void) {
        left?.traversePostOrder(process)
        right?.traversePostOrder(process)
        process(value)
    }
    
    public func traversePreOrder(_ process: (T)-> Void) {
        process(value)
        left?.traversePreOrder(process)
        right?.traversePreOrder(process)
    }
}

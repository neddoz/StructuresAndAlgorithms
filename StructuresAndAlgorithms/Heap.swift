//
//  Heap.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 22/11/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

struct Heap<Element> {
    var elements: [Element]
    let priorityHelperFunction: (Element, Element)-> Bool

    var isEmpty: Bool {
        return elements.isEmpty
    }
    var count: Int {
        return elements.count
    }
    
    
    init(_ elements: [Element], priorityFuction: @escaping (Element, Element)-> Bool) {
        self.elements = elements
        self.priorityHelperFunction = priorityFuction
        buildHeap()
    }
    
    func peek()-> Element? {
        return elements.first
    }
    
    func isRoot(_ index: Int)-> Bool {
        return index == 0
    }
    
    func leftChildIndex(of index: Int)-> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int)-> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int)-> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at index: Int, than secondIndex: Int)-> Bool {
        return priorityHelperFunction(elements[index], elements[secondIndex])
    }
    
    func highestPriorityIndex(between parentIndex: Int, and childIndex: Int)-> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(between: highestPriorityIndex(between: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElements(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else {return}
        self.elements.swapAt(firstIndex, secondIndex)
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
    }
    
    mutating func siftUp(elementAtIndex: Int) {
        let parent = parentIndex(of: elementAtIndex)
        
        guard !isRoot(parent), isHigherPriority(at: elementAtIndex, than: parent) else {
            return
        }
        swapElements(at: parent, with: elementAtIndex)
        siftUp(elementAtIndex: parent)
    }
    
    mutating func siftDown(elementAtIndex: Int) {
        let childIndex = highestPriorityIndex(for: elementAtIndex)
        if elementAtIndex == childIndex {
            return
        }
        swapElements(at: elementAtIndex, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }
    
    mutating func dequeue()-> Element? {
        guard !isEmpty else {return nil}
        swapElements(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func buildHeap() {
        for index in (0..<count/2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
}

extension Heap {
//    public mutating func sort()-> [Element] {
////        for i in stride
//    }
}

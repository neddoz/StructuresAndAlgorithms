//
//  LinkedLists.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 15/11/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

public class ListNode {
    var value: String
    var next: ListNode?
    weak var previous: ListNode?

    init(_ value: String) {
        self.value = value
    }
}

public class LinkedList {

    fileprivate var head: ListNode?
    private var tail: ListNode?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: ListNode? {
        return head
    }
    
    public var last: ListNode? {
        return tail
    }
    
    public func append(_ value: String) {
        let node = ListNode(value)

        if let tailNode = tail {
            tailNode.next = node
            node.previous = tailNode
        } else {
            head = node
        }
        tail = node
    }
    
    public func node(at index: Int)-> ListNode? {
        if index >= 0 {
            
            var node = head
            var computingIndex = index
            while node != nil {
                if computingIndex == 0 {return node}
                computingIndex -= 1
                node = node?.next
            }
        }
        
        return nil
    }

    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: ListNode)-> String {
        
        let previuosNode = node.previous
        let nextNode = node.next
        
        // Handling head
        if let previous = previuosNode {
            previous.next = nextNode
        } else {
            head = nextNode
        }
        
        nextNode?.previous = previuosNode
        
        // Handling tail
        if nextNode == nil {
            tail = previuosNode
        }
    
        // de link node
        node.previous = nil
        node.next = nil

        return node.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }

        return text + "]"
    }
}

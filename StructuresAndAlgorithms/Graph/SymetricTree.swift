//
//  SymetricTree.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 01/01/2021.
//  Copyright © 2021 kayeli dennis. All rights reserved.
//

import Foundation

public class TreeNode {
 public var val: Int
 public var left: TreeNode?
 public var right: TreeNode?
 public init() { self.val = 0; self.left = nil; self.right = nil; }
 public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 self.val = val
 self.left = left
 self.right = right
 }
}

func isSymmetric(_ root: TreeNode?) -> Bool {
    return areSymetric(left: root?.left, right: root?.right)
}

func areSymetric(left: TreeNode?, right: TreeNode?)-> Bool {
    
    if left == nil && right == nil {
        return true
    }
    
    if left == nil || right == nil {
        return false
    }
    
    return left?.val == right?.val
        && areSymetric(left: left?.left, right: right?.right)
        && areSymetric(left: left?.right, right: right?.left)
}


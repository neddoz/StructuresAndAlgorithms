//
//  Memoization.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 12/03/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

/// Cache to prevent computing twice of a value
var cache: [Int: Int] = [0:0, 1:1]

/// Using a fibonucci function to illustrate memoization
public func fib(of number: Int)-> Int {

    /// return 0 if number is zero
    if number < 2 {
        cache[number] = number
        return number
    }

    /// Checking to see if we already have the fibonacci of the current number compted
    if cache[number] == nil {
        let computedValue = fib(of: number - 1) + fib(of: number - 2)
        cache[number] = computedValue
    }

    return cache[number] ?? 0
}

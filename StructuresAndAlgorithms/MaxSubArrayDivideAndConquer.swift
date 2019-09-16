//
//  MaxSubArrayDivideAndConquer.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 05/09/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

func maxSubArrayDivideAndConquer(array: [Int], low: Int) -> Int {
    return 1
}

func maxSubArray(array: [Int])-> Int {
    var finalMax = 0
    var previousMax = finalMax
    for (i, v) in array.enumerated() {
        let temp = max(max(v, previousMax + v), finalMax)
        if temp > finalMax {
            finalMax = temp
        }
        previousMax = previousMax + array[i]
    }
    return finalMax
}

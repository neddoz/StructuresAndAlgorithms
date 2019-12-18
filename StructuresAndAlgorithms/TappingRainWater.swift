//
//  TappingRainWater.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 11/12/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

class Solution {
    func trap(_ height: [Int]) -> Int {
        var maxes: [Int] = []
        var leftMax = 0
        // building the left maxes
        for value in height {
            let maxValue = max(leftMax, value)
            maxes.append(maxValue)
            leftMax = maxValue
        }
        // building the right maxes as well as building the sum of trapped water
        var rightMax = 0
        var index = height.count - 1
        while index >= 0 {
            let maxValue = max(rightMax, height[index])
            let minValue = min(rightMax, maxes[index])
            let height = height[index]
            
            if height < minValue {
                maxes[index] = minValue - height
            } else {
                maxes[index] = 0
            }
            rightMax = maxValue
            index -= 1
        }
        return maxes.reduce(0, +)
    }
}

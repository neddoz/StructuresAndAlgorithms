//
//  BubbleSort.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 06/10/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    func bubbleSort(by areInIncreasingOrder: (Element, Element)-> Bool = (<))-> [Element] {
        var data = self
        for i in 0..<(data.count-1) { // 1
            for j in 0..<(data.count-i-1) where areInIncreasingOrder(data[j+1], data[j]) { // 2
                data.swapAt(j, j + 1)
            }
        }
        return data
    }
}

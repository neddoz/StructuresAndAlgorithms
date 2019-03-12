//
//  InsertionSort.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 06/10/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

extension Array {
    func insertionSort<Element: Comparable>(_ array: [Element],
                                            _ isOrderedBefore: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var mutableArray = array
        for i in 1..<mutableArray.count - 1 {
            let temp = mutableArray[i]
            var index = i
            while (index > 0 && isOrderedBefore(temp, mutableArray[index - 1])) {
                mutableArray[index] = mutableArray[index - 1]
                index -= 1
            }
            mutableArray[index] = temp
        }
        return mutableArray
    }
}

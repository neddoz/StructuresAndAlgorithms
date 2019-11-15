//
//  MergeSort.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 28/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

extension Array {
    
    public func mergeSort<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) {
        // Base case
        if startIndex >= endIndex {
            return
        }
        let middleIndex = (startIndex + endIndex) / 2
        mergeSort(array: &array, startIndex: startIndex, endIndex: middleIndex)
        mergeSort(array: &array, startIndex: middleIndex+1, endIndex: endIndex)
        merge(array: &array, startIndex: startIndex, middleIndex: middleIndex, endIndex: endIndex)
    }
    
    public func merge<T: Comparable> (array: inout [T], startIndex: Int, middleIndex: Int, endIndex: Int) {
        let leftSubarray = Array<T>(array[startIndex...middleIndex])
        let rightSubarray = Array<T>(array[middleIndex+1...endIndex])
        
        var index = startIndex
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
            if leftSubarray[leftIndex] < rightSubarray[rightIndex] {
                array[index] = leftSubarray[leftIndex]
                leftIndex += 1
            }
            else {
                array[index] = rightSubarray[rightIndex]
                rightIndex += 1
            }
            index += 1
        }
        
        while leftIndex < leftSubarray.count {
            array[index] = leftSubarray[leftIndex]
            index += 1
            leftIndex += 1
        }
        
        while rightIndex < rightSubarray.count {
            array[index] = rightSubarray[rightIndex]
            index += 1
            rightIndex += 1
        }
    }
}

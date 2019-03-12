//
//  QuickSort.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 28/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

extension Array {
    
    func quickSort<Element: Comparable>(_ array: [Element])-> [Element] {

        guard array.count > 1 else {return array}
        let pivot = array[array.count/2]
        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        return quickSort(less) + equal + quickSort(greater)
    }
}

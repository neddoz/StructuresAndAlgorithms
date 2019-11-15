
import Foundation

var array = [ 6, 5, 8, 4 , 3 ]
for x in 1..<array.count {
    print(x)
}

func insertionSort(_ array: inout [Int]) {
    for index in 1..<array.count {
        let tempValue = array[index]
        var computingIndex = index
        while computingIndex > 0 && tempValue < array[computingIndex - 1] {
            array[computingIndex] = array[computingIndex - 1]
            computingIndex -= 1
        }
        array[computingIndex] = tempValue
    }
    print("The sorted array is", array)
}

insertionSort(&array)

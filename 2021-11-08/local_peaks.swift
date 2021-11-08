/*
Given an array of integers, return the index of each local peak in the array. A “peak” element is an element that is greater than its neighbors.
*/

// swift
func localPeaks(_ array: [Int]) -> [Int] {
    var result: [Int] = []

    var index = 1
    
    while (index != array.count - 1) {
        let current = array[index]
        let previous = array[index-1]
        let next = array[index+1]

        if (previous < current && current > next) {
            result.append(index)
        }
        index += 1
    }

    return result
}

print(localPeaks([1,2,3,1]))
print(localPeaks([1,3,2,3,4,6,4]))

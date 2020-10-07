// Given an array that was once sorted in ascending order is rotated at some
//pivot unknown to you beforehand (so [0,2,4,7,9] might become [7,9,0,2,4], for
// example). Find the minimum value in that array in O(n) or less.

import Foundation

func findMin(_ array: [Int]) -> Int {
    var low = 0
    var high = array.count - 1

    while array[low] > array[high] {
        if high - low == 1 {
            low = high
        }
        let mid = (low + high) / 2
        if array[low] > array[mid] {
            high = mid
        }
        else {
            low = mid
        }
    }
    return array[low]
}

print(findMin([7, 9, 0, 2, 4]))
print(findMin([0, 2, 4, 7, 9]))
print(findMin([1,2,3,4,5,6,7,8,9]))
print(findMin([6,7,8,9,0,1,2,3,4,5]))

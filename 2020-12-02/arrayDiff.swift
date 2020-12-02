import Foundation
// Given an array of integers and a target value, return the number of pairs of array elements that have a difference equal to a target value.

func arrayDiff(_ arr: [Int], _ target: Int) -> Int {
    var result = 0
    arr.forEach { a in
        arr.forEach { b in
            result += a - b == target ? 1 : 0
        }
    }

    return result
}

print(arrayDiff([1, 2, 3, 4], 1))
print(arrayDiff([1, 2, 3, 4, 5, 6, 7, 8, 9], 1))
print(arrayDiff([2,4,6],2))


//Given an integer array arr, sort the integers in arr in ascending order by the number of 1’s in their binary representation and return the sorted array.

import Foundation

func sortBits(_ arr: [Int]) -> [Int] {
    return arr.sorted(by: { (lhs, rhs) -> Bool in
        return String(lhs, radix: 2).filter { $0 == "1" }.count < String(rhs, radix: 2).filter { $0 == "1" }.count
    })
}

print(sortBits([0,1,2,3,4,5,6,7,8]))
print(sortBits([0,1,2,3,4,5,6,7,47]))
print(sortBits([47,0,1,2,3,4,5,6,7]))


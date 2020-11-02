//You have a character who jumps forward n number of units at a time, and an array representing the road in front of them (where 0 is a flat piece of road, and 1 is an obstacle). Return true or false if your character can jump to the end without hitting an obstacle in front of them.

import Foundation

func characterJump(_ units: Int, _ arr: [Int]) -> Bool {
    if arr.count < 1 || units > arr.count {
        return false
    }
    var index = 0
    while index < arr.count {
        if arr[index] == 1 {
            return false
        }
        else {
            index = index + units
        }
    }

    return true
}

print(characterJump(3, [0,1,0,0,0,1,0]))
print(characterJump(4, [0,1,1,0,1,0,0,0,0]))
print(characterJump(2, [0,1,0,1,0,1,0,1,0]))
print(characterJump(1, [0,1,0,1,0,1,0,1,0]))



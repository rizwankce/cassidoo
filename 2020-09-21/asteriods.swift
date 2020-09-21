import Foundation

// Swift
func asteroids(_ array: [Int]) -> [Int] {
    var asteroids = array

    func collide(_ firstIndex: Int, _ secondIndex: Int) -> Bool {
        let first = asteroids[firstIndex]
        let second = asteroids[secondIndex]
        if first >= 0 && second >= 0 {
            return false
        }
        else if first < 0 && second < 0 {
            return false
        }
        if second < 0 {
            if abs(first) == abs(second) {
                asteroids.remove(at: secondIndex)
                asteroids.remove(at: firstIndex)
                return true
            }
            else if abs(first) < abs(second) {
                asteroids.remove(at: firstIndex)
                return true
            }
            else if abs(second) < abs(first) {
                asteroids.remove(at: secondIndex)
                return true
            }
        }
        return false
    }
    var stop = false
    while !stop {
        var results: [Bool] = Array.init(repeating: true, count: asteroids.count)
        for i in 0 ..< (asteroids.count - 1) {
            let result = collide(i, i+1)
            results.append(!result)
            if result {
                break
            }
        }

        if asteroids.isEmpty {
            break
        }
        stop = results.reduce(true, { $0 && $1})
    }

    return asteroids
}

print(asteroids([5,8,-5]))
print(asteroids([10,-10]))
print(asteroids([-10,5,8,-5,-5]))
print(asteroids([1,2,3,4,6,-10]))
print(asteroids([1,2,11,10,3,4,6,-10]))


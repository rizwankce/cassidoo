/*
Given an array of increasing integers, find the length of the longest fibonacci-like subsequence of the array. If one does not exist, return 0. A sequence is “fibonacci-like” if X_i + X_{i+1} = X_{i+2}.
*/

// Swift
func fibonacciLike(_ input: [Int]) -> Int {
    var result = 0
    let seen :Set<Int> = Set(input)

    input.enumerated().forEach { (i, current) in
        input[i+1 ..< input.count].forEach { j in
            var first = current
            var second = j
            var next = current + j
            var length = 2

            while seen.contains(next) {
                length += 1
                first = second
                second = next

                next = first + second
            }
            result = max(result, length)
        }
    }

    return result == 2 ? 0 : result
}
print(fibonacciLike([1,3,7,11,12,14,18]))
print(fibonacciLike([1,1,2,3,5,8]))


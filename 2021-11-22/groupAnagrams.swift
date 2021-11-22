/*
 Given an array of strings, group the anagrams together in separate arrays. An anagram is a word or phrase formed by rearranging the letters of another word or phrase, using all the original letters exactly once.
 */

func groupAnagrams(_ words: [String]) -> [[String]] {
    var result: [[String]] = []
    var index = 0

    while index < words.count {
        var group: [String] = []
        let current = words[index]

        var found = false
        for r in result {
            if r.contains(current) {
                found = true
            }
        }

        if !found {
            group.append(current)
            permute(items: current).forEach { p in
                let str = p.map() { String($0) }.joined()
                if  words.filter({ $0 != current && $0.count == current.count }).contains(str) && !group.contains(str) {
                        group.append(str)
                }
            }

            result.append(group)
        }

        index += 1
    }

    return result
}

print(groupAnagrams(["eat","tea","ten","poop","net","ate"]))
print(groupAnagrams(["ross","ssor","rza","arz","smile","ate"]))

func permute<C: Collection>(items: C) -> [[C.Iterator.Element]] {
    var scratch = Array(items) // This is a scratch space for Heap's algorithm
    var result: [[C.Iterator.Element]] = [] // This will accumulate our result

    func heap(_ n: Int) {
        if n == 1 {
            result.append(scratch)
            return
        }

        for i in 0..<n-1 {
            heap(n-1)
            let j = (n%2 == 1) ? 0 : i
            scratch.swapAt(j, n-1)
        }
        heap(n-1)
    }

    heap(scratch.count)

    return result
}


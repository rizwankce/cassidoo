/*
 Given a string containing digits from 2-9, return all possible letter combinations that the number could represent based on phone numbers/letters. For example, 2 could be a, b, or c, 3 could be d, e, or f, and so on.
 */

let letters = [
  "2" : ["a","b", "c"],
  "3" : ["d","e", "f"],
  "4" : ["g","h", "i"],
  "5" : ["j","k", "l"],
  "6" : ["m","n", "o"],
  "7" : ["p","q", "r","s"],
  "8" : ["t","u", "v"],
  "9" : ["w","x", "y","z"],
]

func phoneLetter(_ string: String) -> [String] {
  var result: [String] = []
  string.forEach { char in
    if let pos = letters[String(char)] {
      if result.isEmpty {
        result = pos
      }
      else {
        var next: [String] = []
        result.forEach { r in
          pos.forEach { p in
            next.append(r + p)
          }
        }
        result = next
      }
    }

  }
  return result
}

print(phoneLetter("9"))
print(phoneLetter("23"))

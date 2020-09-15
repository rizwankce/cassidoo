/*
Write a function that converts a sentence into Pig Latin.
*/

// swift
func pigLatin(_ word: String) -> String {
    let vowels = "aeiou".map { $0 }

    if let l = word.first,
        vowels.contains(l) {
        return "\(word)yay"
    }

    var c = ""
    let result = word.split(maxSplits: 1) { (letter) -> Bool in
        c = String(letter)
        return vowels.contains(letter)
    }
    let str = result.count != 1 ? result[1] + result[0] : result[0]
    return String(c + str + "ay")
}

func translateToPigLatin(_ sentence: String) -> String {
    let result = sentence.split(separator: " ").map { pigLatin(String($0)) }
    return result.reduce("") { (r1, r2) -> String in
        return r1.count != 0 ? "\(r1) \(r2)" : r2
    }
}

print(translateToPigLatin("pig latin banana"))
print(pigLatin("pig"))
print(pigLatin("latin"))
print(pigLatin("banana"))
print(pigLatin("happy"))
print(pigLatin("duck"))
print(pigLatin("me"))

print(pigLatin("smile"))
print(pigLatin("string"))
print(pigLatin("store"))

print(pigLatin("explain"))
print(pigLatin("i"))

/*
Given a string s and a character c, return the number of occurrences of c in s
*/

// swift
func numChars(_ aString: String, _ char: Character) -> Int {
    return aString.lowercased().filter { $0 == char }.count
}

print(numChars("oh heavens", "h"))
print(numChars("oh heavens", "e"))
print(numChars("oh heavens", "y"))

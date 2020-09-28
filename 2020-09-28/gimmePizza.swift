import Foundation
// swift
func gimmePizza(_ array: String, _ totalSlice: Int) -> Int {
    struct People: Codable {
        let name: String
        let num: Int
    }

    guard let json = try? JSONDecoder().decode([People].self, from: array.data(using: .utf8)!) else { return 0 }
    let slices = json.map { $0.num }.reduce(0,+)
    return Int(ceil(Double(slices)/Double(totalSlice)))
}
let arr = """
[{ "name": "Joe", "num": 9 }, { "name": "Cami", "num": 3 }, { "name": "Cassidy", "num": 4 }]
"""
print(gimmePizza(arr, 8))

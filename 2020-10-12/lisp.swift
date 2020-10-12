//Given a basic Lisp-like string expression, parse it (where the available functions are add, subtract, multiply, and divide, and they all take in 2 values).

import Foundation

func babyLisp(_ string: String) -> Int {
    func calc(_ op: String, _ lhs: Int, _ rhs: Int) -> Int {
        switch op {
        case "add": return lhs + rhs
        case "subtract": return lhs - rhs
        case "multiply": return lhs * rhs
        case "divide": return lhs / rhs
        default: fatalError("Unidentified operation \(op)")
        }
    }

    func eval(components: inout [String]) -> Int {
        let op = components.removeFirst()
        if Int(op) != nil {
            return Int(op)!
        }

        let left = eval(components: &components)
        let right = eval(components: &components)

        return calc(op, left, right)
    }
    var components = string.filter { $0 != "(" && $0 != ")" }.components(separatedBy: " ")
    return eval(components: &components)
}

print(babyLisp("(add 1 2)"))
print(babyLisp("(multiply 4 (add 2 3))"))
print(babyLisp("(multiply (subtract 10 5) (add 2 3))"))
print(babyLisp("(divide (subtract 10 5) (add 2 3))"))

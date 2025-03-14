import Cocoa

// How to return values from functions

let root = sqrt(169)
print(root)


func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let roll = rollDice()
print("You rolled a \(roll)")

// When a function has only 1 line of code, the "return" keyword can be removed
func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

let result = areLettersIdentical(string1: "listen", string2: "silent")
print(result)


func pytagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}
let c = pytagoras(a: 3, b: 4)
print(c)


func oneLinePytagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

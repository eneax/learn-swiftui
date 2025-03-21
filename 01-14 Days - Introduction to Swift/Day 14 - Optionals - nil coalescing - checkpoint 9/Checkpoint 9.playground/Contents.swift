import Cocoa

/*
 Checkpoint 9
 
 - Write a function that accepts an optional array of integers, and returns one randomly.
 - If the array is missing or empty, return a random number in the range 1 through 100.
 - Write your function in a single line of code.
*/

func getNumber(in array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}


func getNumber2(in array: [Int?]?) -> Int {
    lazy var random = Int.random(in: 1...100) // Code will be executed only if actually needed
    return (array?.randomElement() ?? random) ?? random
}

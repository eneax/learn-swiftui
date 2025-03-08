import Cocoa

/*
 How to create variables and constants
 - var: create a new variable (initialization)
 - let: create a constant (value must never change)
 - prefer constant over variables
*/

var greeting = "Hello, World!"

var name = "Ted"
name = "Rebecca"
name = "Keeley"

let username = "eneax"
// username = "eneaxharja" -> ERROR

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)


// How to create strings

let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let movie = """
A day in
the life of an
Apple engineer
"""

print(movie.count)

print(result.uppercased())

print(movie.hasPrefix("A day in"))
print(filename.hasSuffix(".jpg"))


/*
 How to store whole numbers
 - Int: for whole numbers such as 3, 5, 50, or 5 million
*/

let score = 10
let reallyBig = 100_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

var counter = 10
counter = counter + 5
counter += 5
print(counter)

let number = 120
print(number.isMultiple(of: 3))


/*
 How to store decimal numbers
 - Double (double-precision floating-point number)
 - Swift allocates twice the amount of storage as some older languages would do
 - You cannot mix Int and Double
*/

let decNumber = 0.1 + 0.2
print(decNumber)

let a = 1
let b = 2.0
let c = a + Int(b)
// let c = Double(a) + b

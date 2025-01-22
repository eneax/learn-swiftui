// Import collection of code from Apple - don’t delete it!
import Cocoa

// The value of the greeting variable can change as the program runs
var greeting = "Hello, playground"

/*
 1. How to create variables and constants
 
 When you create a variable, Swift can figure out what type the variable is based on what kind of data you assign to it,
 and from then on that variable will always have that one specific type.
 
 Prefer to use constants rather than variables:
 – Swift can optimize your code a little better
 - Swift makes sure you never change a constant’s value by accident
*/

// Variables are a great way to store temporary data in your program
var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

var name = "Enea"
// If you don’t ever want to change a value, you need to use a constant instead
let username = "eneax"


/*
 2. How to create strings
 - when you assign text to a constant or variable, we call that a string
 - Strings are case-sensitive in Swift
*/

let actor = "Denzel Washington"
print(actor.count)

let filename = "movie.mov"
print(filename.hasSuffix("mov"))

let result = "⭐️ You win! ⭐️"
print(result.uppercased())

// Use other double quotes inside your string
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

// Use multi-line strings - the triple quotes at the start and end are on their own line
let movie = """
A day in
the life of an
Apple engineer
"""


/*
 3. How to store whole numbers (integers)
*/

let score = 100
let bigScore = 100_000_000

let doubleScore = score * 2
let squareScore = score * score

var counter = 7
counter += 13
counter -= 1
counter *= 2
counter /= 2
print(counter)

let numberOfStars = 120
print(numberOfStars.isMultiple(of: 5))


/*
 4. How to store decimal numbers (floating-point numbers)
 - you cannot mix Int and Double
 - floating-point numbers are complex because computers are trying to use binary to store complicated numbers,
   so the system is designed to create very close approximations
*/

let doublePrecisionFloatingPointNumber = 0.1 + 0.2
print(doublePrecisionFloatingPointNumber)

let a = 1
let b = 2.0
let c = a + Int(b)
print(c)
let d = Double(a) + b
print(d)

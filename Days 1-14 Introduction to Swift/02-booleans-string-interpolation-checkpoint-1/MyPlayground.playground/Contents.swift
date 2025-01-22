import Cocoa


/*
 How to store truth with Booleans
 - Booleans have a special operator, !, which means “not”. It flips a Boolean’s value from true to false, or false to true.
*/

let filename = "movie.mov"
print(filename.hasSuffix("mov"))

let number = 123
print(number.isMultiple(of: 2))

var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)


/*
 How to join strings together
 - using the plus sign
 - using string interpolation that can place variables of any type directly inside strings (better performance)
*/

let firstPart = "Hello"
let secondPart = "World"
let joinedString = firstPart + " " + secondPart
print(joinedString)

let num = 11
let missionMessage = "Apollo \(num) landed on the moon."
print(missionMessage)

print("2 + 2 = \(2 + 2)")


/*
 Checkpoint 1 - Celsius to Fahrenheit
*/

let celcius = 17.0
let fahrenheit = ((celcius * 9) / 5) + 32
print("\(celcius)°C is \(fahrenheit)°F")

let convertedBack = ((fahrenheit - 32) * 5) / 9
print("\(fahrenheit)°F is \(convertedBack)°C")

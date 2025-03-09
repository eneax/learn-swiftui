import Cocoa

// How to store truth with Booleans
let isMultiple = 120.isMultiple(of: 3)

var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)


// How to join strings together
// String interpolation as a way of injecting custom data into strings at runtime
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I am \(age) years old."
print(message)

print("5 + 5 = \(5 + 5)")

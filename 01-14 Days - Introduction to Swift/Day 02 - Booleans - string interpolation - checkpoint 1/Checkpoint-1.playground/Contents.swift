import Cocoa

// Checkpoint 1
let celsius = 25.0
let fahrenheit = ((celsius * 9) / 5) + 32
print("Temperature: \(celsius)°C is equal to \(fahrenheit)°F")

let convertedBack = ((fahrenheit - 32) * 5) / 9
print("Temperature: \(fahrenheit)°F is equal to \(convertedBack)°C")

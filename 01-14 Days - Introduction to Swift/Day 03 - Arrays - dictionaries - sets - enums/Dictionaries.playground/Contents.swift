import Cocoa

/*
 How to store and find data in dictionaries
 - key-value stored info
 - optimized for fast retrieval
 - no duplicate keys (value will be overwritten)
 - you can specify a "default" for missing values
*/

let employee = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]
print(employee["name", default: "Unknown"])

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2020: "Tokyo",
    2024: "Paris"
]
print(olympics[2028, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"
print(archEnemies)

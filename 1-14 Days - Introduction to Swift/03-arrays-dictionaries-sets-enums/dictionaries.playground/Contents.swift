import Cocoa

/*
Dictionaries
 - they are not zero-based indexed
 - they optimize the way they store items for fast retrieval (key-value storage)
 - existance of data is optional: might be there or not
 - you need to provide a default value, in case data is not there (nil value)
 - they don't allow duplicate keys to exist
*/

var employee = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["location", default: "Unknown"])

let hasGraduated = [
    "Alvin": true,
    "Betty": false,
    "Cecil": true
]

let olimpics = [
    2012: "London",
    2016: "Rio",
    2020: "Tokyo",
    2024: "Paris"
]
print(olimpics[2012, default: "Unknown"])

// Start with empty dictionary
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin" // it overwrites "The Joker"
print(archEnemies)

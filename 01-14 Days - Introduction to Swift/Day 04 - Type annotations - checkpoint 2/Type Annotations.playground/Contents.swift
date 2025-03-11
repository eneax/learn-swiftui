import Cocoa

/*
 How to use type annotations
 - prefer type inference as much as possible
 - Swift must always know what type of data it is working with
*/

let playerName: String = "Roy"
var luckyNumber: Int = 17
let pi: Double = 3.141
var isAuthenticated: Bool = true

var albums: [String] = ["Red", "Fearless"]

var user: [String: String] = ["id": "@twostraws"]

var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Woman, Other"
])

// Create an empty array of strings
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
style = .dark

// Type annotation required
let username: String
// lots of code
username = "@eneaxharja"
// lots more of code
print(username)

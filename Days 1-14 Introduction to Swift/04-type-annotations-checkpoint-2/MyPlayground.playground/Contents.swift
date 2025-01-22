import Cocoa

/*
Type Annotations are useful when:
 - Swift can’t figure out what type should be used
 - you want Swift to use a different type from its default
 - you don’t want to assign a value just yet
*/

let playerName: String = "Roy"
let luckyNumber: Int = 17
let pi: Double = 3.14
let isAuthenticated: Bool = true

var emptuArray: [String] = [String]()
var anotherEmptyArray: [String] = []

var team: [String] = ["Ronaldo", "Messi"]
var user: [String: String] = ["id": "@eneax"]
var books: Set<String> = Set([
    "The Three-Body Problem",
    "The Dark Forest",
    "Death's End"
])

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = UIStyle.light
style = .dark
print(style)


/*
Checkpoint 2
 - the challenge is to create an array of strings,
 - then write some code that prints the number of items in the array
 - and also the number of unique items in the array
*/

let cars: [String] = ["Ford", "Toyota", "BMW", "Ford", "Toyota", "BMW", "Ford", "Toyota", "BMW"]
let uniqueCars: Set<String> = Set(cars)
print("Total cars: \(cars.count). Total unique cars: \(uniqueCars.count).")

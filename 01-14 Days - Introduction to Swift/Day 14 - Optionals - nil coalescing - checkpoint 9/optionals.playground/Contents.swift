import Cocoa

/*
 How to handle missing data with optionals
 - optionals -> the value might or might not be there (Schrödinger's data type)
 - think about opening a box, you might find some value or nothing at all
 - any data can be optional -> String?, Int? etc.
 - nil -> nothing, no value
*/

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"] // nil

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is: \(marioOpposite)")
}


var username: String? = nil

if let unwrappedUsername = username {
    print("Hello, \(unwrappedUsername)!")
} else {
    print("Hello, world!")
}


var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3: String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil


func square(number: Int) -> Int {
    return number * number
}

var number: Int? = nil

// Shadowing
// if let unwrappedNumber = number {
// if let number = number {
if let number {
    print(square(number: number))
} else {
    print("No number provided.")
}


let album = "Red"
let albums = ["Reputation", "Red", "1989"]

if let position = albums.firstIndex(of: album) {
    print("Found \(album) at position \(position).")
}

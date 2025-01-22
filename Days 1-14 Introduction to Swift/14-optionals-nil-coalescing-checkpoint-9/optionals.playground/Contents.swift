import Cocoa

/*
 How to handle missing data with optionals
 - optional is trying to answer the question "what if our variable doesn't have any sort of value at all?" (Schrödinger's cat)
 - you add a question mark to the type, "String?"
 - Swift uses "nil" to represent no value
*/

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

// if the optional has a value inside, it will be unwrapped and set into "marioOpposite" String
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
} else {
    print("Mario has no opposite")
}

var username: String? = nil

if let unwrappedUsername = username {
    print("We got a user: \(unwrappedUsername)")
} else {
    print("The optional was empty.")
}


var arr1 = [Int]() // empty array
var arr2: [Int]? = nil // array doesn't exist


func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

// or using "shadowing" technique
if let number = number {
    print(square(number: number))
}

// or even shorter syntax
if let number {
    print(square(number: number))
}


/*
 How to unwrap optionals with guard-else
 - guard requires an early return or throw error
*/
func printSquare(of number: Int?) {
    guard let number = number else {
        // code runs is number has no value inside
        print("Missing input")
        return // is required
    }
    
    print("\(number) squared is \(number * number)")
}


/*
 How to unwrap optionals with nil coalescing
 - it lets you unwrap an optional and provides a default value if the optional was empty
*/
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

// "new" will be a string, not an optional string
let new = captains["Serenity"] ?? "N/A"
print(new)


let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"


struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)


let input = ""
let num = Int(input) ?? 0 // conversion fails and you get 0 by default
print(num)


/*
 How to handle multiple optionals using optional chaining
 - it's a simplified syntax for reading optionals inside optionals
 - if the option has a value, run some code on that value
 - if the option has no value, then you get "nil"
*/

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print(chosen)


struct AnotherBook {
    let title: String
    let author: String?
}

var book2: AnotherBook? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"
print(author2)


/*
 How to handle function failure with optionals
 - we either call it using "try" and handle errors appropriately
 - or if we're certain the function will not fail we use "try!"
 - if we were wrong our code will crash
 - use "try?" to convert a throwing function call into an optional
*/

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// try? as alternative to do-catch
do {
    let result = try getUser(id: 23)
    print(result)
} catch {
    // it failed!
    print("Error: \(error)")
}

if let result = try? getUser(id: 23) {
    print(result)
}

/*
 Checkpoint 9
 - write a function that accepts an optional array of integers, and returns one randomly
 - if the array is missing or empty, return a random number in the range 1 through 100.
*/

func getNumber(in array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}


func getNumber2(in array: [Int?]?) -> Int {
    // "lazy" means that random is not calculated until is actually used
    lazy var random = Int.random(in: 1...100)
    return (array?.randomElement() ?? random) ?? random
}

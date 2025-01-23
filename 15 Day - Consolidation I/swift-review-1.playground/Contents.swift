import Cocoa

/*
 The Swift programming language
*/

// Creating constants and variables
var name = "Ted"
name = "Rebecca"

let user = "Daphne"
print(user)


// Strings
let actor = "Tom Cruise"
let quote = "He tapped a sign saying \"Believe\" and walked away."
let movie = """
A day in
the life of an
Apple engineer
"""

print(actor.count)
print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))


// Integers
let score = 10
let higherScore = score + 10
let halvedScore = score / 2

var counter = 10
counter += 5

let number = 120
print(number.isMultiple(of: 3))
let id = Int.random(in: 1...1000)


// Decimals
let scoreDecimal = 3.0


// Booleans
let goodDogs = true
let gameOver = false
var isSaved = false
isSaved.toggle()


// Joining strings
let nameString = "Taylor"
let age = 26
let message = "I am \(nameString) and I'm \(age) years old."
print(message)


// Arrays
var colors = ["Red", "Green", "Blue"]
let numbers = [4, 8, 15, 16]
var readings = [0.1, 0.5, 0.8]

print(colors[0])
print(readings[2])
colors.append("Tartan")
colors.remove(at: 0)
print(colors.count)
print(colors.contains("Octarine"))


// Dictionaries
let employee = [
    "name": "Taylor",
    "job": "Singer"
]

print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])


// Sets
var numbersSet = Set([1, 1, 3, 5, 7])
print(numbersSet)
numbersSet.insert(10)


// Enums
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}
var day = Weekday.monday
day = .friday


// Type annotations
var scoreDouble: Double = 0
let player: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isEnabled: Bool = true
var albumsArr: Array<String> = ["Red", "Fearless"]
var userDict: Dictionary<String, String> = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])
var albumsArr2: [String] = ["Red", "Fearless"]
var userDict2: [String: String] = ["id": "@twostraws"]
var teams: [String] = [String]()
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = .light


// Conditions
let age2 = 16
if age2 < 12 {
    print("You can't vote")
} else if age2 < 18 {
    print("You can vote soon.")
} else {
    print("You can vote now.")
}

let temp = 26
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}


// Switch statements
enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("A nice day.")
case .rain:
    print("Pack an umbrella.")
default:
    print("Should be okay.")
}


// The ternary conditional operator
let ageTernary = 18
let canVote = ageTernary >= 18 ? "Yes" : "No"


// Loops
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works on \(os).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1..<13 {
    print("5 x \(i) is \(5 * i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

var count = 10
while count > 0 {
    print("\(count)…")
    count -= 1
}
print("Go!")

let files = ["me.jpg", "work.txt", "sophie.jpg"]
for file in files {
    if file.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(file)")
}


// Functions
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func rollDiceShort() -> Int {
    Int.random(in: 1...6)
}


// Returning multiple values from functions
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let userF = getUser()
print("Name: \(userF.firstName) \(userF.lastName)")

let (firstName, _) = getUser()
print("Name: \(firstName)")


// Customizing parameter labels
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let resultNew = isUppercase(string)

func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)


// Providing default values for parameters
func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)!")
    } else {
        print("Hi, \(person)!")
    }
}

greet("Tim", formal: true)
greet("Taylor")


// Handling errors in functions
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

do {
    let result = try checkPassword(string)
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

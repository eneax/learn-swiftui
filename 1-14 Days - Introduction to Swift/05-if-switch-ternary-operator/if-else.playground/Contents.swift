import Cocoa

// If statements

let speed = 88
let score = 60
let age = 18

if speed >= 88 {
    print("Where we are going, we don't need roads.")
}

if score < 60 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You are eligible to vote.")
}


let ourName = "Taylor Swift"
let friendName = "Adele"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}


var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)


let country = "Canada"

if country == "Australia" {
    print("G'day!")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)!")
}

/*
 Check for empty string
 - the most efficient approach is using "isEmpty"
 - you can also do it with -> username == ""
 - you can also do it with -> username.count == 0
*/


var username = "taylorswift13"

if username.isEmpty {
    username = "Anonymous"
}

print("Welcome, \(username)")


/*
 Check multiple conditions
*/

let votingAge = 16

if votingAge >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you are too young to vote.")
}

// AND logical operator

let temp = 25

if temp > 20 && temp < 30 {
    print("It's a nice day!")
}

// OR logical operator

let userAge = 14
let hasParentalConsent = true

if age >= 18 || hasParentalConsent {
    print("You can buy the game.")
}


enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there is a bike path...")
} else if transport == .car {
    print("Time to get stuck in traffic")
} else {
    print("I'm going to hire a scooter now.")
}

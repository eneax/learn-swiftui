import Cocoa

/*
 Closures
 - you can assign func to variables, pass func into func, and even return func from other func
 - closures allow you to skip creating a separate function, and just assign the functionality directly to a constant or variable
 - a closure is a chunk of code you can pass around and call whenever you want
 - when you copy a func or use a closure, you don't need the parameter name
 - you can create closures as anonymous functions
 - Closures cannot use external parameter labels
*/

// Copy a function - you don’t write the parentheses after it
func greetUser() {
    print("Hi, there!")
}

greetUser()
var greetUserCopy: () -> Void = greetUser
greetUserCopy()


func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

// Closure expression without parameters
let sayHello = {
    print("Hello!")
}

sayHello()


// Closure expression with parameters
let sayHelloWithParameters = { (name: String) -> String in
    return "Hello, \(name)!"
}

sayHelloWithParameters("Enea")


// Custom sorted function
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    } else {
        return name1 < name2
    }
}

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

/*
 - functions like sorted() let you pass in custom code to adjust how they work
 – you don’t need to write out a new function just for that one usage
*/
let captainFirstTeamClosure = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    } else {
        return name1 < name2
    }
})
print(captainFirstTeamClosure)


// Functions vs Closures syntax
func pay(user: String, amount: Int) {
    // code
}

let payment = { (user: String, amount: Int) in
    // code
}

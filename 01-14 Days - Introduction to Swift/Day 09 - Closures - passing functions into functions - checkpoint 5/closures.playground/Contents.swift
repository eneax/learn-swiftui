import Cocoa

/*
 How to create and use closures
 - a closure is a chunk of code we can pass around and call whenever we want
 - "in" marks the beginning of the fn body
 - closures cannot use external parameter labels
 - don't use parameter names when calling a closure
*/

// Copy a function
func greetUser() {
    print("Hi there!")
}

greetUser()
var greetCopy: () -> Void = greetUser
greetCopy()


func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989) // the "for" name is gone when you copy
print(user)


// Closure expressure -> { print("Hello!") }
let sayHello = {
    print("Hello!")
}
sayHello()


// Closure with params
let sayHelloTo = { (name: String) -> String in
    print("Hello, \(name)!")
    return "Hello, \(name)!"
}

sayHelloTo("Alice")


// Closures as callback
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeam)

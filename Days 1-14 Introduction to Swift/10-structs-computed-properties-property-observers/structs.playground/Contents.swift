import Cocoa

/*
 Structs
 - helps you create complex data types
 = variables and constants that belong to structs are called "properties"
 - functions that belong to structs are called "methods"
 - when you create a constant or variable out of a struct, you call that an instance – you might create a dozen unique instances of the Album struct, for example
 - when you create instances of structs you do so using an initializer like this: Album(title: "Wings", artist: "BTS", year: 2016).
*/

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) - \(year) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
red.printSummary()

let letItBe = Album(title: "Let It Be", artist: "The Beatles", year: 1970)
letItBe.printSummary()


struct Employee {
    let name: String
    var vacationRemaining: Int
    
    // this func changes data belonging to the struct
    // "mutating" is not needed if you are reading data
    mutating func takeVacation(days: Int) {
        if vacationRemaining >= days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! You don't have enough vacation days left!")
        }
    }
}

// You cannot call a mutation function on a constant struct, so you need to use "var"
var archer = Employee(name: "Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)

// Swift silently creates a special function inside the struct called init()
var archerInit = Employee.init(name: "Archer 2", vacationRemaining: 14)
archerInit.takeVacation(days: 5)


struct Delorean {
    var speed = 0
    mutating func accelerate() {
        speed += 1
        if speed == 88 {
            travelThroughTime()
        }
    }
    func travelThroughTime() {
        print("Where we're going we don't need roads.")
    }
}

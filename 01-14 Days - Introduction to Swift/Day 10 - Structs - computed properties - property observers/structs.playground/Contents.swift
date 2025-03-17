import Cocoa

/*
 How to create your own structs
 - a "mutating" func is allowed to change the data of the struct, but only if that struct is created as a variable
 - if you assign a default value to a constant property, that will be removed from the initializer entirely
 - to assign a default but leave open the possibility of overriding it when needed, use a variable property
*/

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) by \(artist), \(year)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
print(red.title)
red.printSummary()


/*
 Naming
 - "name" and "vacationRemaining" are properties
 - "takeVacation" is a method
 - "archer" is an instance
 - "Employee(name: "Sterling Archer")" is the initializer of the struct
*/
struct Employee {
    let name: String
    var vacationRemaining = 14
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! Not enough vacation days.")
        }
    }
}

// you need to use "var" if you want to use a mutating func
var archer = Employee(name: "Sterling Archer")
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 30)

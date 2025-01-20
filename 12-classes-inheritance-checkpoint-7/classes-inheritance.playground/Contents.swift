import Cocoa

/*
 Classes
 - they create custom data types
 - inheritance: one class can build upon functionality in another class, gaining all its properties and methods as a starting point
 - Swift won’t automatically generate a memberwise initializer for classes
 - copies of structs are always unique, whereas copies of classes actually point to the same shared data
 - deinitializer: it allows you to clean up any special resources you allocated when that last copy of a class instance is destroyed
*/

class Game {
    var score = 0 {
        didSet {
            print("Score is now: \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


/*
 Inheritance:
 - create classes based on existing classes
 - child class inherits from parent class
 - child can access properties on parent class
 - child can add new properties unique to the child
 - if a child wants to change a method from a parent, you must use "override" in the child class’s version
 - If you know for sure that your class should not support inheritance, you can mark it as "final". It means the class itself can inherit from other things, but can’t be used to inherit from. No child class can use a final class as its parent.
*/

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joe = Manager(hours: 6)
robert.work()
robert.printSummary()
joe.work()

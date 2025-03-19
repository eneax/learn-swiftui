import Cocoa

/*
 How to make one class inherit from another
 - override -> child class can override a method it inherits from parent class
 - final -> when you don't want other classes to inherit from the final class
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

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let bob = Developer(hours: 8)
bob.work()
bob.printSummary()

let alice = Manager(hours: 8)
alice.work()
alice.printSummary()

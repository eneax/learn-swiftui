import Cocoa

/*
 How to create and use protocol extensions
*/

extension Collection {
    var isNotEmpty: Bool {
        return isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Toad", "Peach", "Yoshi", "Bowser"]

if guests.isNotEmpty {
    print("Guests count is: \(guests.count)")
}


// Protocol Oriented Programming
protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hello, my name is \(name).")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

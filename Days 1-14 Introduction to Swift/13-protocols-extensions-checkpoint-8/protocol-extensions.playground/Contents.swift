import Cocoa

/*
 How to create and use protocol extensions
 - extend the entire "Collection", so new property applies to "Arrays", "Sets" and "Dictionaries"
*/

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach", "Toad"]

if guests.isNotEmpty {
    print("Guests count: \(guests.count)")
}


// extend protocol and provide a default implementaion of a method
protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hello, \(name)!")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

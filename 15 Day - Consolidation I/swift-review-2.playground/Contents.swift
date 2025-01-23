import Cocoa

// Closures
let sayHello = {
    print("Hi there!")
}

sayHello()

let sayHelloClosure = { (name: String) -> String in
    "Hi \(name)!"
}

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})


// Trailing closures and shorthand syntax
//let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]
//let onlyT = team.filter({ (name: String) -> Bool in
//    return name.hasPrefix("T")
//})
//print(onlyT)

//let onlyT = team.filter({ (name: String) -> Bool in
//    name.hasPrefix("T")
//})

//let onlyT = team.filter({ name in
//    name.hasPrefix("T")
//})

//let onlyT = team.filter { name in
//    name.hasPrefix("T")
//}

//let onlyT = team.filter {
//    $0.hasPrefix("T")
//}


// Structs
struct Album {
    let title: String
    let artist: String
    var isReleased = true

    func printSummary() {
        print("\(title) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()


// Computed properties
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}

//var vacationRemaining: Int {
//    get {
//        vacationAllocated - vacationTaken
//    }
//
//    set {
//        vacationAllocated = vacationTaken + newValue
//    }
//}


// Property observers
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3


// Custom initializers
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}


// Access control
struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}


// Static properties and methods
struct AppData {
    static let version = "1.3 beta 2"
    static let settings = "settings.json"
}


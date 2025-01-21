import Cocoa

// Checkpoint 8

protocol Building {
    var type: String { get }
    var rooms: Int { get }
    var cost: Int { get set }
    var agent: String { get set }
    func printSummary()
}

extension Building {
    func printSummary() {
        print("Talk to \(agent) to buy this \(type) for $\(cost).")
    }
}

struct House: Building {
    let type = "house"
    var rooms: Int
    var cost: Int
    var agent: String
}

struct Office: Building {
    let type = "office"
    var rooms: Int
    var cost: Int
    var agent: String
}

let exampleHouse = House(rooms: 3, cost: 500_000, agent: "John Doe & Co")
exampleHouse.printSummary()

let exampleOffice = Office(rooms: 5, cost: 1_000_000, agent: "The Office inc")
exampleOffice.printSummary()

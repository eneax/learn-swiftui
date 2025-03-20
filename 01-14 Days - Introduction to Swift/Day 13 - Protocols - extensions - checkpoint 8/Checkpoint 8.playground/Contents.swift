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
        print("Talk to agent \(agent) to buy this \(type) for only $\(cost).")
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

let house = House(rooms: 3, cost: 1_000_000, agent: "John Doe")
house.printSummary()

let office = Office(rooms: 10, cost: 10_000_000, agent: "Jane Doe")
office.printSummary()

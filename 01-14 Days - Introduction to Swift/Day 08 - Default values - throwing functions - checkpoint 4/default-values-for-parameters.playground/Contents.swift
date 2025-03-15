import Cocoa

// How to provide default values for parameters

func printTimesTable(for number: Int, end: Int = 10) {
    for i in 1...end {
        print("\(number) x \(i) = \(number * i)")
    }
}

printTimesTable(for: 5)
printTimesTable(for: 5, end: 12)


var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true) // remove all items but leave the array able to hold 4 items (very useful for arrays with lots of items)
print(characters.count)

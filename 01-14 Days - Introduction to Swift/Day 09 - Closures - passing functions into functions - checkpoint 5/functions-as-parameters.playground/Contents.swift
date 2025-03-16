import Cocoa

/*
 How to accept functions as parameters
 
*/

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

// Functions as parameters
func generateRandomNumber() -> Int {
    Int.random(in: 1...20)
}

let rolls = makeArray(size: 50, using: generateRandomNumber)
print(rolls)


// Using closures - no need to create separate function
let newRolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)


// Multiple parameters
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

import Cocoa

// Checkpoint 4

enum RootError: Error {
    case tooLow, tooHigh, notFound
}

func squareRoot(of number: Int) throws -> Int {
    if number < 1 {
        throw RootError.tooLow
    }
    
    if number > 10_000 {
        throw RootError.tooHigh
    }
    
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    
    throw RootError.notFound
}

let number = 1239

do {
    let root = try squareRoot(of: number)
    print("The square root of \(number) is \(root).")
} catch RootError.tooLow {
    print("Sorry, \(number) is too low. Please specify a number from 1 to 10,000.")
} catch RootError.tooHigh {
    print("Sorry, \(number) is too high. Please specify a number from 1 to 10,000.")
} catch RootError.notFound {
    print("Sorry, there is no integer square root for \(number).")
} catch {
    print("Sorry, there was a problem.")
}

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
    
    for i in 1..<10_000 {
        if i * i == number {
            return i
        }
    }
    
    throw RootError.notFound
}

let number = 6562

do {
    let root = try squareRoot(of: number)
    print("The square root of \(number) is \(root).")
} catch RootError.tooLow {
    print("Sorry, \(number) is too low – please specify a value from 1 through 10,000.")
} catch RootError.tooHigh {
    print("Sorry, \(number) is too high – please specify a value from 1 through 10,000.")
} catch RootError.notFound {
    print("Sorry, we could not find an integer square root for \(number).")
} catch {
    print("Sorry, there was a problem.")
}

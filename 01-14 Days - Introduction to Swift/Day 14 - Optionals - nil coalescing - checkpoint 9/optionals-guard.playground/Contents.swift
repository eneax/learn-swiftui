import Cocoa

/*
 How to unwrap optionals with guard
 - code inside guard-else runs if the variable has no value inside
 - guard-else requires the early return
 - use "if let" if you want to unwrap some optionals
 - use "guard let" if you're specifically checking that conditions are correct before continuing
*/

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("Square of \(number) is \(number * number)")
}

printSquare(of: 5)
printSquare(of: nil)


func uppercase(string: String?) -> String? {
    guard let string = string else {
        return nil
    }

    return string.uppercased()
}

if let result = uppercase(string: "Hello") {
    print(result)
}


func isLongEnough(_ string: String?) -> Bool {
    guard let string = string else {
        return false
    }
    
    if string.count >= 8 {
        return true
    } else {
        return false
    }
}

if isLongEnough("Mario Odyssey") {
    print("Let's play that!")
}


func describe(occupation: String?) {
    guard let occupation = occupation else {
        print("You don't have a job.")
        return
    }

    print("You are an \(occupation).")
}

let job = "engineer"
describe(occupation: job)

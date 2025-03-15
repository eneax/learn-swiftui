import Cocoa

/*
 How to handle errors in functions in 3 steps
 - "throws" means the fn can throw errors
*/

// 1. Tell Swift about the possible errors that can happen.
enum PasswordError: Error {
    case short, obvious
}

// 2. Write a function that can flag up errors if they happen.
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count == 8 {
        return "Ok"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Very good"
    }
}


// 3. Call that function, and handle any errors that might happen.
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage.")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

import Cocoa

/*
 How to handle errors in functions
 1. define the kinds of errors that can occur inside a function
 2. write a func that will trigger one or more of those errors (using "throws")
 3. run the function and handle any errors that might occur (using "do-try-catch")
*/

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "password" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "Ok"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let password = "password"

do {
    let result = try checkPassword(password)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("Please use a different password.")
} catch {
    print("There was an error.")
}

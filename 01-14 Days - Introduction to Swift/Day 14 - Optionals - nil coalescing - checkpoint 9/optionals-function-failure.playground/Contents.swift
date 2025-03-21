import Cocoa

/*
 How to handle function failure with optionals
 - optional try (try?) to have the function return an optional value
 - if the function ran without throwing errors, then the optional will contain the return value
 - if any error was thrown the function will return nil
 - this means we don't get to know exactly what error was thrown
*/

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 1) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)


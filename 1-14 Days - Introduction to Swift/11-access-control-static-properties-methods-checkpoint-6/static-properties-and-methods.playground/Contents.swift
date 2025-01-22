import Cocoa

/*
 Static properties and methods
 - sometimes you want to add a property or method to the struct itself, rather than to one particular instance of the struct
 - you can't access non-static code from static code
 - to access static code from non-static code, always use your type's name such as School.studentCount. You can also use "Self" to refer to the current type.
*/

// 1. use static properties to organize common data in your apps
struct AppData {
    static let version = "1.0.0"
    static let saveFileName = "settings.json"
    static let homeURL = "https://hackingwithswift.com"
}

print(AppData.version)

// 2. use static data is to create examples of your structs
struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "h4irf0rce0ne")
}

print(Employee.example)

import Cocoa

/*
 How to return multiple values from functions
 - using tuples
 - tuples have a fixed number of values of fixed types inside them
*/

func getUser() -> (firstName: String, lastName: String) {
    return (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")


func getUser2() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let user2 = getUser2()
print("Name: \(user2.0) \(user2.1)")


func getUser3() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let (firstName, _) = getUser3()
print("Name: \(firstName)")

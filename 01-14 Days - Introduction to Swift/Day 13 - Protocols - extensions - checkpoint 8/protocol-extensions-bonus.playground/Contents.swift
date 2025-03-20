import Cocoa

/*
 How to get the most from protocol extensions
 - self -> refers to the current value (5)
 - Self -> refers to the current type (Int)
*/

extension Int {
    func squared() -> Self {
        return self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())


// Swift uses protocol inheritance so that Comparable automatically also means Equatable
struct User: Comparable {
    let name: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        return lhs.name < rhs.name
    }
}

let user1 = User(name: "Alice")
let user2 = User(name: "Bob")
print(user1 == user2)
print(user1 != user2)
print(user1 < user2)
print(user1 <= user2)
print(user1 > user2)
print(user1 >= user2)

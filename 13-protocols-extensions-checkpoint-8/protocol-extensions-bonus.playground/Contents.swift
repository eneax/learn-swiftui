import Cocoa

// "Self" refers to the current type (for example Int or Double)
// "self" refers to the current value (for example 5)
extension Numeric {
    func squared() -> Self {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())

let decimalNumber = 3.141
print(decimalNumber.squared())


// Conform struc to two protocols (Comparable builds on Equatable)
struct User: Comparable {
    let name: String
    
    // less than function belonging to the User struct
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}

let user1 = User(name: "Link")
let user2 = User(name: "Zelda")
print(user1 == user2)
print(user1 != user2)
print(user1 < user2)
print(user1 <= user2)
print(user1 > user2)
print(user1 >= user2)

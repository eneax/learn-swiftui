import Cocoa

/*
 How to copy classes
 - classes are "reference types" in Swift
 - all copies of a class instance share the same data
 - any changes you make to one copy will automatically change the other copies
 - it allows you to share common data across all parts of our app
 - structs are "value types" and do not share their data amongst copies
*/

class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"

print(user1.username) // Taylor
print(user2.username) // Taylor


/*
 Deep Copy
 - it creates a unique copy of a class instance
 - future changes won’t impact the original data
*/

class UserDeepCopy {
    var username = "Anonymous"
    
    func copy() -> UserDeepCopy {
        let user = UserDeepCopy()
        user.username = username
        return user
    }
}

var u1 = UserDeepCopy()
var u2 = u1.copy()
u2.username = "Taylor"

print(u1.username) // Anonymous
print(u2.username) // Taylor

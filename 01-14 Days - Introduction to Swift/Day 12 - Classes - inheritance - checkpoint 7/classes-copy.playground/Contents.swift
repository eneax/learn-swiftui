import Cocoa

/*
 How to copy classes
 - classes are reference types in Swift
 - all copies of a class all refer back to the same underlying pot of data
*/

class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1
user2.username = "taylorswift"
print(user1.username)
print(user2.username)

// Deep copy -> the original class is not modified
var user3 = user1.copy()
user3.username = "alice"
print(user1.username)
print(user3.username)


// Reference example
class Magazine {
    var pageCount = 132
}

var example = Magazine()

var wired = example
wired.pageCount = 164

var vogue = example
vogue.pageCount = 128

print(wired.pageCount)
print(vogue.pageCount)

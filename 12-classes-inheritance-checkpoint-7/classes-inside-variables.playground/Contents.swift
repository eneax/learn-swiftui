import Cocoa

/*
 How to work with variables inside classes
 - Swift’s classes work a bit like signposts: every copy of a class instance we have is actually a signpost pointing to the same underlying piece of data
 - The "mutating" keyword is not allowed with classes
*/

class User {
    var name = "Paul"
}

let user1 = User()
user1.name = "Taylor"
print(user1.name)

var user2 = User()
user2.name = "Swift"
user2 = User()
print(user2.name)

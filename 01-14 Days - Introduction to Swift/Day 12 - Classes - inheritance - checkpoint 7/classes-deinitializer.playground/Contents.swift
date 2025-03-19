import Cocoa

/*
 How to create a deinitializer for a class
 - no need for "func"
 - they don't take parameters
 - they don't return data
 - automatically called when the last copy of a class instance is destroyed
*/

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead...")
    }
}

//for i in 1...3 {
//    let user = User(id: i)
//    print("User \(user.id): I'm in control!")
//}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is empty!")


/*
 ARC
 
 Behind the scenes Swift performs something called automatic reference counting.
 
 ARC tracks how many copies of each class instance exists: every time you take a copy of a class instance Swift adds 1 to its reference count, and every time a copy is destroyed Swift subtracts 1 from its reference count.
 
 When the count reaches 0 it means no one refers to the class any more, and Swift will call its deinitializer and destroy the object.
*/

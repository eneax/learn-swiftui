import Cocoa

/*
 How to create a deinitializer for a class
 - think of it as the opposite of an initializer
 - it gets called when the object is destroyed rather than when it’s created
 - it can never take parameters or return data
 - it will automatically be called when the final copy of a class instance is destroyed
 - you never call deinitializers directly, they are handled automatically by the system
 - structs don’t have deinitializers
 - Scope: it refers to the context where information is available
 - conditions, loops, and functions all create local scopes
*/

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

// the User instance created inside the loop is destroyed when the loop iteration finishes
for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

// If you add in an array the User instances as they were created, they would only be destroyed when the array is cleared:
var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop finished!")
users.removeAll()
print("Array cleared!")

/*
 Automatic Reference Counting (or ARC)
 - Swift performs ARC behind the scenes
 - ARC tracks how many copies of each class instance exists
 - every time you take a copy of a class instance Swift adds 1 to its reference count
 - every time a copy is destroyed Swift subtracts 1 from its reference count
 - When the count reaches 0 it means no one refers to the class any more, and Swift will call its deinitializer and destroy the object.
*/

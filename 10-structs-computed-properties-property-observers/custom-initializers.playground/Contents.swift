import Cocoa

/*
 Custom initializers
 - initializers are specialized methods designed to prepare a new struct instance to be used
 - all properties must have a value by the time the initializer ends
 - when you implement your own custom initializers you’ll lose access to Swift’s default initializer (memberwise initializers)
*/

// Default initializer for structs
struct PlayerDefault {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

let playerDefault = PlayerDefault(name: "John", number: 1)
print(playerDefault.name)
print(playerDefault.number)


struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...100)
    }
}

let player = Player(name: "John")
print(player.name)
print(player.number)

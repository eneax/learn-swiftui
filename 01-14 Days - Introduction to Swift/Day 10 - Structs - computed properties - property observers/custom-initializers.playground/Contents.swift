import Cocoa

/*
 How to create custom initializers:
 - all properties must have a value by the time the initializer ends
 - self refers to the current instance of a struct
*/

struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "John")
print(player)


struct Language {
    var nameEnglish: String
    var nameLocal: String
    var speakerCount: Int
    init(english: String, local: String, speakerCount: Int) {
        self.nameEnglish = english
        self.nameLocal = local
        self.speakerCount = speakerCount
    }
}

let french = Language(english: "French", local: "français", speakerCount: 220_000_000)
print(french)

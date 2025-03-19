import Cocoa

/*
 How to create your own classes
 - inheritance -> one class can build upon functionality from another class
 - if you copy an instance of a class, both copies share the same data
 - classes have deinitializers, which are methods that are called when an instance of the class is destroyed
*/

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

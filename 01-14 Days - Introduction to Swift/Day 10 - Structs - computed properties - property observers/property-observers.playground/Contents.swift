import Cocoa

/*
 How to take action when a property changes
 - Property observers let us attach functionality to be run before or after a property is changed
 - "newValue" and "oldValue" are automatically provided by Swift
 - You can NOT attach a property observer to a constant, because it will never change
*/

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1


struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("John D")
app.contacts.append("Jane S")

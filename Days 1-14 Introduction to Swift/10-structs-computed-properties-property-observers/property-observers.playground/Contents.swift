import Cocoa

/*
 Property observers
 - special pieces of code that run before or after a property is changed
 - "didSet" observer runs when the property just changed (debugging)
 - "willSet" observer runs before the property changed (handle animations)
 - you can't attach a property observer to a constant, because it will never change
*/

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("John")
app.contacts.append("Jane")
app.contacts.append("Jack")

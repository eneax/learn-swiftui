import Cocoa

/*
 How to limit access to internal data using access control
 - private -> don't let anything outside the struct access the property
 - fileprivate -> don't let anything outside the file access the property
 - public -> let anyone, anywhere access the propery
 - private(set) -> let anyone read this property, but only let my methods write it
 - if you use private access control, you'll need to create a custom initializer
*/

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}


struct Doctor {
    var name: String
    var location: String
    private var currentPatient = "No one"
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}

let drJones = Doctor(name: "Esther Jones", location: "Bristol")


struct Contributor {
    private var name = "Anonymous"
}

let paul = Contributor()

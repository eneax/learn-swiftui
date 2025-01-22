import Cocoa

/*
 Limit access to internal data using access control
 - structs let us access their properties and methods freely
 – sometimes you want to hide some data from external access
 - if you use private access control, you'll need to create your own initializer

 Access control options:
 - use "private" for "don’t let anything outside the struct use this"
 - use "fileprivate" for "don’t let anything outside the current file use this"
 - use "public" for "let anyone, anywhere use this"
 - use "private(set)" for "let anyone read this property, but only let my methods write it"
*/

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 50)

if success {
    print("Withdrew money successfully")
} else {
    print("Insufficient funds")
}

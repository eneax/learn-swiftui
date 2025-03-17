import Cocoa

/*
 How to compute property values dynamically
 - "newValue" is automatically provided by Swift inside the setter
 - computed properties "must always" have an explicit type
 - constants cannot be computed properties
*/

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationRemaining)
print(archer.vacationAllocated) // 4 + 5 = 9

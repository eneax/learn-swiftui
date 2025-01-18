import Cocoa

/*
 Dynamic Compute property values
 - they perform a calculation, instead of static stored property
 - computed properties must always have an explicit type
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

var john = Employee(name: "John Doe", vacationAllocated: 14)
john.vacationTaken += 4
john.vacationRemaining = 5 // newValue
print(john.vacationAllocated)

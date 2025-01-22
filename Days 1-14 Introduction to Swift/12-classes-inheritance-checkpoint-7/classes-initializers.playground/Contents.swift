import Cocoa

/*
 How to add initializers for classes
 - If a child class has any custom initializers, it must always call the parent’s initializer after it has finished setting up its own properties (if it has any).
 - Swift won’t automatically generate a memberwise initializer for classes.
 - "super" allows us to call up to methods that belong to our parent class (or super class), such as its initializer
 - If a subclass does not have any of its own initializers, it automatically inherits the initializers of its parent class.
*/

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let ferrari = Car(isElectric: false, isConvertible: false)

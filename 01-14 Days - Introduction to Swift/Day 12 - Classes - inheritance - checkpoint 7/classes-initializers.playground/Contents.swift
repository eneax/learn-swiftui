import Cocoa

/*
 How to add initializers for classes
 - super -> allows you to call a method from the parent class
 - if child class has no initializers, it will automatically inherit the parent initializer
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

let lamborghiniAventador = Car(isElectric: false, isConvertible: true)

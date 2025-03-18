import Cocoa

// Checkpoint 6

struct Car {
    let model: String
    let seat: Int
    let maximumGear: Int = 10
    private(set) var gear: Int = 1
    
    mutating func changeGear(difference: Int) {
        gear += difference
        
        if gear < 1 {
            gear = 1
        } else if gear > maximumGear {
            gear = maximumGear
        }
    }
}

var car = Car(model: "Toyota Corolla", seat: 5)
car.changeGear(difference: 1)
print(car.gear)
car.changeGear(difference: -2)
print(car.gear)

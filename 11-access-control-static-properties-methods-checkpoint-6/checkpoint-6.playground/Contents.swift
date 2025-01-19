import Cocoa

// Checkpoint 6

struct Car {
    let model: String
    let seats: Int
    let maximumGears: Int
    private(set) var gear = 1
    
    mutating func changeGear(difference: Int) {
        gear = gear + difference
        
        if gear < 1 {
            gear = 1
        } else if gear > maximumGears {
            gear = maximumGears
        }
    }
}

var bmwX5 = Car(model: "BMW X5", seats: 5, maximumGears: 8)
bmwX5.changeGear(difference: 1)
print(bmwX5.gear)
bmwX5.changeGear(difference: -2)
print(bmwX5.gear)

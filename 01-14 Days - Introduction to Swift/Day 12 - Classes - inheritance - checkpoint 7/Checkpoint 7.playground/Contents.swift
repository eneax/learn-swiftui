import Cocoa

// Checkpoint 7

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func speak() {
        assertionFailure("This should never be called.")
    }
}

class Dog: Animal {
    override func speak() {
        print("Woof!")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("Bark!")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("Yip!")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    override func speak() {
        print("Meow!")
    }
}

final class Persian: Cat {
    override func speak() {
        print("Purr!")
    }
}

final class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
}

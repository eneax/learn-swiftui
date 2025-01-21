import Cocoa

/*
 How to use opaque return types
*/

func getRandomNumber() -> Int {
    Int.random(in: 0...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}

// Both Int and Bool conform to a common Swift protocol called Equatable
// The Equatable protocol is what allows us to use "=="

print(getRandomNumber() == getRandomNumber())


// Returning a protocol from a function is useful because it lets you hide information
// Rather than stating the exact type that is being returned, you get to focus on the functionality that is returned.

// You can upgrade the two functions to opaque return types using "some":

func getRandomNumberSome() -> some Equatable {
    Int.random(in: 0...6)
}

func getRandomBoolSome() -> some Equatable {
    Bool.random()
}

//Swift always knows the exact type of data being sent back, and SwiftUI will use that to create its layouts.
print(getRandomNumberSome() == getRandomNumberSome())

// When you see "some View" in SwiftUI, it’s us telling Swift "this is going to send back some kind of view to lay out, but I don’t want to write out the exact thing – you figure it out for yourself."

import Cocoa

/*
 How to use opaque return types
 - you can return a protocol
 - opaque return types let us hide information in our code, but not from the Swift compiler
 - when you write "some Equatable", Swift knows the exact type of data going back (Int, Bool, etc.)
*/

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

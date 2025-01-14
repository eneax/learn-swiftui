import Cocoa

/*
How to use a while loop
 - given a condition, a while loop will continually execute the loop body until the condition is false
 - while loops are useful when you don’t know how many times the loop will go around
*/

var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("Blast off!")


// roll the dice
var roll = 0

while roll != 6 {
    roll = Int.random(in: 1...6)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 6!
print("Critical hit!")

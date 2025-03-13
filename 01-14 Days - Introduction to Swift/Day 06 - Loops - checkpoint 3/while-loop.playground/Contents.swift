import Cocoa

/*
 How to use a while loop to repeat work
 - when you don't know how many times the loop will run
 
 We can repeat the same code until:
 - the user asks us to stop
 - a server tell us to stop
 - we’ve found the answer we’re looking for
 - we’ve generated enough data
*/

var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("Blast off!")


let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)


var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll).")
}

print("Critical hit!")

print(200.isMultiple(of: 10000))

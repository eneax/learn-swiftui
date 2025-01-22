import Cocoa

/*
How to use a "for" loop
 - The code inside the braces is called "loop body"
 - One cycle through the loop body is a "loop iteration"
 - "os" is the loop variable
 - the loop variable exists only inside the loop body, and will change to a new value in the next loop iteration
 - "up to and including" x...y creates a range that starts at whatever number x is, and counts up to and including whatever number y is
 - "up to but excluding" ..< counts up to but exclude the final number (useful for arrays)
 - "one-sided range" 1... to say “give me 1 to the end of the array"
*/

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

// loop over an array
for os in platforms {
    print("Swift works great on \(os).")
}

// loop over a range of numbers
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// ranges are their own unique data type in Swift
for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }
    
    // start a new line
    print()
}

// count up to but exclude the final number: ..<
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

// use an underscore if you don't need the loop variable
var lyrics = "Haters gonna"

for _ in 1...5 {
    lyrics += " hate"
}

print(lyrics)

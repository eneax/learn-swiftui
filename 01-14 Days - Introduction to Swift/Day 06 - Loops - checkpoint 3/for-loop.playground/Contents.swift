import Cocoa

/*
 How to use a for loop to repeat work
 - range is a unique data type -> 1...n (1 and n included)
*/

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}


for i in 1...10 {
    print("5 x \(i) = \(5 * i)")
}


// Nested loops
for i in 1...10 {
    print("The \(i) times table")
    
    for j in 1...10 {
        print("   \(j) x \(i) = \(j * i)")
    }
    
    print()
}


// Two range operators
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 up to but not including 5: \(i)")
}


// Use underscore when you don't need the value that is currently being read
var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

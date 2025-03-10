import Cocoa

/*
 How to use sets
 - very fast data lookup
 - sets are unordered
 - cannot contain duplicates
*/

let actors = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson"
])
print(actors)

var footballers = Set<String>()
footballers.insert("Lionel Messi")
footballers.insert("Cristiano Ronaldo")
footballers.insert("Vini Jr")
print(footballers)

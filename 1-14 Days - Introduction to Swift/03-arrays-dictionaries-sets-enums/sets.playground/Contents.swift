import Cocoa

/*
Sets
 - they are similar to arrays, except you can’t add duplicate items,
 - they don’t store their items in a particular order (very fast data look up)
 - you insert items, instead of appending them
 - sorted() set will return a sorted array containing the set’s items
*/

let actors = Set([
    "Tom Hanks",
    "Brad Pitt",
    "Jennifer Aniston",
    "Nicolas Cage"
])
print(actors)

var cars = Set<String>()
cars.insert("Ford")
cars.insert("Toyota")
cars.insert("BMW")
print(cars)

// Sets must contain unique items, so the second "Red" will be discarded
var colors = Set(["Red", "Green", "Red"])
print(colors)

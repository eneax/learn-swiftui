import Cocoa

/*
 Checkpoint 2
 - Creates an array of strings
 - Prints the number of strings in that array
 - Prints the number of unique strings in that array
*/

let cities = ["London", "Berlin", "Paris", "Rome", "Paris", "Berlin", "London"]
let uniqueCities = Set(cities)
print("Total number of cities: \(cities.count). Unique number of cities: \(uniqueCities.count).")


// Extra
let names = ["John", "Michael", "Terry", "Graham", "Eric", "Terry"]
var uniques = Set<String>()

print("Adding \(names[0]) to the set: \(uniques.insert(names[0]))")
print("Adding \(names[1]) to the set: \(uniques.insert(names[1]))")
print("Adding \(names[2]) to the set: \(uniques.insert(names[2]))")
print("Adding \(names[3]) to the set: \(uniques.insert(names[3]))")
print("Adding \(names[4]) to the set: \(uniques.insert(names[4]))")
print("Adding \(names[5]) to the set: \(uniques.insert(names[5]))")

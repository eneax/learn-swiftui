import Cocoa

/*
Arrays
 - zero-based index
 - if you try to access an index that doesn't exist, the program will crash
 - an array can contain only one particular data type (i.e. number not allowed in a string array)
 - they always hold data in the order you add it
*/

var beatles = ["John", "Paul", "George", "Ringo"]
print(beatles)

beatles.append("Liverpool")
print(beatles)

let beatlesCity = beatles[4]
print(beatlesCity)

// Start with an empty array and add items to it one by one
var scores = Array<Int>()
scores.append(10)
scores.append(20)
scores.append(30)
scores.append(40)
scores.append(50)
print(scores)
print(scores[1])

// Short way of creating an array of strings Array<String>()
var albums = [String]()
albums.append("Help!")
albums.append("Yellow Submarine")
albums.append("Revolver")
print(albums)
print(albums.count)
print(albums.sorted()) // sorted() returns a new array

var cities = ["London", "New York", "Tokyo", "Paris", "Berlin"]
print(cities.count)

cities.remove(at: 3)
print(cities.count)

cities.removeAll()
print(cities.count)

let bondMovies = ["Casino Royale", "Spectre", "Skyfall"]
print(bondMovies.contains("No Time to Die"))

/*
Reversing an array
 - When you reverse an array, Swift doesn’t actually do the work of rearranging all the items
 - Instead, it just remembers to itself that you want the items to be reversed
 - When you print out reversedPresidents, don’t be surprised to see it’s not just a simple array any more
*/

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

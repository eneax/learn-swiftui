import Cocoa

/*
 How to store ordered data in arrays
 - zero-based index
 - type safety (arrays contain only one type of data at a time)
*/

var beatles = ["John", "Paul", "George", "Ringo"]
print(beatles[0])
beatles.append("Pete")
print(beatles)

var scores = Array<Int>()
scores.append(100)
scores.append(90)
scores.append(80)
print(scores)

var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
print(albums)

var footballers = ["Ronaldo"]
footballers.append("Messi")
footballers.append("Buffon")
print(footballers)
print(footballers.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Berlin"]
print(cities.sorted()) // returns new array


// When you reverse an array, Swift doesn’t actually do the work of rearranging all the items.
// Instead it remembers to itself that you want the items to be reversed.
let presidents = ["Bush", "Obama", "Trump", "Biden", "Trump"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

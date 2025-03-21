import Cocoa

/*
 How to unwrap optionals with nil coalescing
 - it unwraps the optional and if nil, it provides a default value
*/

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

// "new" will be a String, not an Optional
let new = captains["Serenity"] ?? "N/A"
print(new)


let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favoriteShow = tvShows.randomElement() ?? "None"
print(favoriteShow)


struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)


let input = ""
let number = Int(input) ?? 0
print(number)

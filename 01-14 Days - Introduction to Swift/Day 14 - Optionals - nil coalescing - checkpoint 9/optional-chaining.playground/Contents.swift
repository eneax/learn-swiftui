import Cocoa

/*
 How to handle multiple optionals using optional chaining
 - optional chaining means -> if the optional has a values inside, unwrap it then...
*/

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")


struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)


func albumReleased(in year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    case 2017: return "Reputation"
    default: return nil
    }
}

let album = albumReleased(in: 2006)?.uppercased() ?? "Unknown"
print(album)


let capitals = ["Scotland": "Edinburgh", "Wales": "Cardiff"]
let scottishCapital = capitals["Scotland"]?.uppercased()
print(scottishCapital ?? "Not found")


let favoriteColors = [
    "Paul": "Red",
    "Charlotte": "Pink"
]
let charlotteColor = favoriteColors["Charlotte"]?.lowercased()
print(charlotteColor ?? "Not found")

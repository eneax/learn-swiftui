import Cocoa

/*
 How to create and use extensions
 - extensions add functionality to any type
 - prefer "extension" over global "func"
 - extensions make it easy to change a value directly, rather than return a new value
 - extensions may not add new stored properties, only computed properties
*/

extension String {
    func trimmed() -> String {
        // "self" refers to the current string
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
quote.trim()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines)
print(lyrics.lines.count)

// "Book" struct that has the default memberwise initializer as well as a custom initializer:
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init (title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "The Lord of the Rings", pageCount: 1178, readingHours: 24)

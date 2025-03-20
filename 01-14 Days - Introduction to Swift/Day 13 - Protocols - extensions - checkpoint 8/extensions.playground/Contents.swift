import Cocoa

/*
 How to create and use extensions
 - Extensions let us add functionality to existing types (classes, structs, etc.)
 - it is helpful for modifying types we don't own (written by Apple or someone else)
 - if you are returning a new value, use word ending in "ed" -> trimmed()
 - if you are mutating the curent value -> trim()
*/

var quote = "   The truth is rarely pure and never simple   "
let trimmedQuote = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmedQuote)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let trimmed = quote.trimmed()
print(trimmed)

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)


// More examples
extension Double {
    var isNegative: Bool {
        return self < 0
    }
}

extension String {
    var isLong: Bool {
        return count > 25
    }
    
    mutating func append(_ other: String) {
        self += other
    }
    
    func isUppercased() -> Bool {
        return self == self.uppercased()
    }
}

extension Bool {
    func toggled() -> Bool {
        if self == true {
            return false
        } else {
            return true
        }
    }
}

extension Int {
    var isAnswerToLifeUniverseAndEverything: Bool {
        let target = 42
        return self == target
    }
    
    func cubed() -> Int {
        return self * self * self
    }
    
    func clamped(min: Int, max: Int) -> Int {
        if (self > max) {
            return max
        } else if (self < min) {
            return min
        }
        return self
    }
}


/*
 Two options for creating book instances:
 - one option where you specify "readingHours"
 - one option where you use the extension to calculate "readingHours"
*/

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "The Lord of the Rings", pageCount: 1000, readingHours: 24)
let got = Book(title: "Game of Thrones", pageCount: 800)

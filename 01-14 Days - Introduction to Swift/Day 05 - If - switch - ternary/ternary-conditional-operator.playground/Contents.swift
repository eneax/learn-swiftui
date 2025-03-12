import Cocoa

// How to use the ternary conditional operator for quick tests

let age = 18
let canVote = age >= 18 ? "Yes" : "No"
print(canVote)


let names = ["Alice", "Bob", "Charlie"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)


enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

import Cocoa

/*
Ternary conditional operator has three parts:
 - what condition are we checking?
 - what to do if the condition is true?
 - what to do if the condition is false?
*/

let age = 18
let canVote = age >= 18 ? "Yes" : "No"
print(canVote)

let names = ["John", "Jane", "Jack"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

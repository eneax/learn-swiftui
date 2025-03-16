import Cocoa

/*
 How to use trailing closures and shorthand syntax
*/

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let longSyntaxSorted = team.sorted(by: { (a: String, b: String) -> Bool in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }
    return a < b
})

let sorted = team.sorted { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }
    return a < b
}

let shortSorted = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

let reverseTeam = team.sorted {
    return $0 > $1
}

let shortReverseTeam = team.sorted { $0 > $1 }
print(shortReverseTeam)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercasedTeam = team.map { $0.uppercased() }
print(uppercasedTeam)

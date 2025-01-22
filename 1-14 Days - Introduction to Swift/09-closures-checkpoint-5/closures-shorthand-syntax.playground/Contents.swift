import Cocoa

/*
 Closures and shorthand syntax
*/

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeam)

let captainFirstTeamShort = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

print(captainFirstTeamShort)

// Trailing closures and shorthand syntax
let captainFirstTeamShorter = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

print(captainFirstTeamShorter)


let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)


let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)


let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

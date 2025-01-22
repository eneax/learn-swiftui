import Cocoa

/*
Customize parameter labels
 Swift gives us two important ways to control parameter names:
 - we can use underscore (_) for the external parameter name so that it doesn’t get used (for example: append(), contains(), hasPrefix())
 - or we can add a second name there so that we have both external and internal parameter names
*/

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO WORLD"
let result = isUppercase(string: string)
print(result)

// if you add underscore, you can remove the external parameter label
func isUppercase2(_ string: String) -> Bool {
    string == string.uppercased()
}

let string2 = "HELLO WORLD"
let result2 = isUppercase2(string)
print(result)


// Internal and external parameter labels
func printTimesTables(for number: Int) {
    for i in 1...10 {
        print("\(number) x \(i) = \(number * i)")
    }
}

printTimesTables(for: 5)

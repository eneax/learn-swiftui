import Cocoa

/*
 How to customize parameter labels
 - remove external parameter name if you use "underscore"
 - use external and internal parameters
*/

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HEY"
let result = isUppercase(string)
print(result)


func printTimesTable(for number: Int) {
    for i in 1...10 {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTable(for: 5)

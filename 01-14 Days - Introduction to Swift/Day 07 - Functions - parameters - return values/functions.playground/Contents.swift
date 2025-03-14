import Cocoa

/*
 How to reuse code with functions
 - parameter -> placeholder
 - argument -> actual value
 - any data you create inside a function is automatically destroyed when the function is finished
*/

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()


func printTimesTable(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTable(number: 5, end: 10)

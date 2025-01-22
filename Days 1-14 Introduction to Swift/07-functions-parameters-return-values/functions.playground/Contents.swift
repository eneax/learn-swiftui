import Cocoa

/*
Functions
 - functions wrap up pieces of code so they can be used in lots of places
 - "func" keyword marks the start of the function
 - "showWelcome" is the name of the function
 - add the body of the function between "{}"
 - the parentheses "()" are used when you create the function and when you call it
 - "()" are used to add configuration options for a function
 - Any data created inside a function is automatically destroyed when the function is finished
*/

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

// "number" and "end" are parameters -> placeholder names that are filled with values when the function is called
func printTimesTable(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}

// "number 5" and "end 12" are arguments -> the actual values being passed to the function (order matters)
printTimesTable(number: 5, end: 12)


/*
Return values from functions
 - write an arrow then a data type before your function’s opening brace
 - use the "return" keyword
*/

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print("You rolled a \(result)")


func areLettersIdentical(string1: String, string2: String) -> Bool {
    // when a function has only one line of code, we can remove the "return" keyword entirely
    string1.sorted() == string2.sorted()
}

print(areLettersIdentical(string1: "abc", string2: "cab"))


func pythagoras(a: Double, b: Double) -> Double {
    let input = (a * a) + (b * b)
    let root = sqrt(input)
    return root
}

func shortPythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)


func greet(name: String) -> String {
    return name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}

print(greet(name: "Enea"))


/*
 Return multiple values from functions -> Tuples
 - Tuples have a fixed size
 - Swift can't know ahead of time if dictionary keys are present, unlike with tuples
*/

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

// You can destructure tuples
let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

// Swift already knows the tuples names
func getUser2() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

// Even if we don't know the tuple names, we know how many values there are
func getUser3() -> (String, String) {
    ("Taylor", "Swift")
}

let user3 = getUser3()
print("Name: \(user3.0) \(user3.1)")


// If you don’t need all the values from the tuple you can use _ to ignore that part of the tuple
// let (firstName, _) = getUser()
// print("Name: \(firstName)")

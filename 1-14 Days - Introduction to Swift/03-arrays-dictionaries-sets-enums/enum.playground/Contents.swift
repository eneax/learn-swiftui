import Cocoa

/*
Enum (short for enumeration)
 - it is a set of named values we can create and use in our code
 - Swift stores enums in a highly optimazed way
*/

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

enum Weekend {
    case saturday
    case sunday
}

var day = Weekday.monday
print(day)
day = Weekday.friday
print(day)

// Once you assign a value to a variable or constant, its data type becomes fixed.
// This means you can skip the enum name after the first assignment, like this:
day = .thursday
print(day)

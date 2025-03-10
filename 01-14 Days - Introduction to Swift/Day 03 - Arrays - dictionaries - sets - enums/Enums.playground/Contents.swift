import Cocoa

/*
 How to create and use enums (enumerations)
 - Swift stores enums in a very optimized way
 - efficient and safe to store values like: directions, error types, genres of movies, months of the year or days of the week
*/

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

enum WeekdayShort {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = .wednesday
print(day)

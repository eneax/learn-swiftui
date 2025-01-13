import Cocoa

/*
 switch statements
 - Swift checks its cases in order and runs the first one that matches
 - switch statements are exhaustive -> list all outcomes as case statements (enums) or use default
 - no duplicate cases
*/

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("It's sunny")
case .rain:
    print("It's raining")
case .wind:
    print("It's windy")
case .snow:
    print("It's snowing")
default:
    print("Unknown")
}


let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}


// If you explicitly want Swift to carry on executing subsequent cases, use fallthrough.

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

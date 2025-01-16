import Cocoa

/*
How to provide default values for parameters
 - adding parameters to functions lets us add customization points
 - sometimes we want to make these customization points available to keep our code flexible
 - other times you don’t want to think about it
*/

func printTimesTable(for number: Int, end: Int = 10) {
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTable(for: 2, end: 12)
printTimesTable(for: 2)


/*
 removeAll()
 - Swift will automatically remove all the items in the array
 - then free up all the memory that was assigned to the array
 - sometimes you might be about to add lots of new items back into the array
 - there's a second form of this function that removes the items while keeping the previous capacity
 - "keepingCapacity" property set to false by default
*/

var characters = ["Lana", "Pam", "Sally"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

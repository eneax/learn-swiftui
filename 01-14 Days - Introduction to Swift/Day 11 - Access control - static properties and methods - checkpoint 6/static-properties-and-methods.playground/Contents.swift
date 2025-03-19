import Cocoa

/*
 Static properties and methods
 - store common functionality you use across an entire app
 - store example data
*/

struct AppData {
    static let version = "1.0 beta 2"
    static let saveFileName = "settings.json"
    static let homeURL = "https://www.example.com"
}
AppData.version


struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "alice", password: "password")
}
Employee.example


struct FootballTeam {
    static let teamSize = 11
    var players: [String]
}


struct Order {
    static let orderFormat = "XXX-XXXX"
    var orderNumber: String
}

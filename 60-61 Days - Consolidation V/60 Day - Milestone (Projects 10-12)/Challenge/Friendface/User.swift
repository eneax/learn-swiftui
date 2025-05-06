//
//  User.swift
//  Friendface
//
//  Created by Enea Xharja on 06.05.25.
//

import Foundation

struct User: Hashable, Identifiable, Codable {
    let id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]

    static let example = User(id: UUID(), isActive: true, name: "Enea Xharja", age: 99, company: "X Industries", email: "eneax@hackingwithswift.com", address: "555, Taylor Swift Avenue, Nashville, Tennessee", about: "Eneas is currently learning Swift and iOS development.", registered: Date.now, tags: ["swift", "swiftui", "books"], friends: [])
}

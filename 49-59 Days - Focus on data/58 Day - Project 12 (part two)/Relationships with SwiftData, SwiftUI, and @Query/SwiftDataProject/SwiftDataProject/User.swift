//
//  User.swift
//  SwiftDataProject
//
//  Created by Enea Xharja on 03.05.25.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    @Relationship(deleteRule: .cascade) var jobs = [Job]() // when you delete a user, delete also their jobs too
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}

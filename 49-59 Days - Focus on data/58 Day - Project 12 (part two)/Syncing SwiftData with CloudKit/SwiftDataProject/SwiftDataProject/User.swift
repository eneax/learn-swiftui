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
    var name: String = "Anonymous"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]() // when you delete a user, delete also their jobs too
    
    var unwrappedJobs: [Job] {
        jobs ?? []
    }
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}

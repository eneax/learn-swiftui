//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Enea Xharja on 03.05.25.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        /*
         - We are not trying to change the User array
         - We are trying to change the SwiftData query that produces the array
         - The underscore is Swift's way of getting access to that query
         - We are creating the query from whatever date gets passed in
        */
        _users = Query(
            filter: #Predicate<User> { user in
                user.joinDate >= minimumJoinDate
            },
            sort: sortOrder
        )
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}

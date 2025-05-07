//
//  UsersList.swift
//  Friendface
//
//  Created by Enea Xharja on 07.05.25.
//

import SwiftData
import SwiftUI

struct UsersList: View {
    var userStatus: UserStatus
    var sortOrder: [SortDescriptor<User>]
    
    @Environment(\.modelContext) var modelContext
    
    @Query private var users: [User]
    
    var body: some View {
        List(users) { user in
            NavigationLink(value: user) {
                HStack {
                    Circle()
                        .fill(user.isActive ? .green : .red)
                        .frame(width: 12)
                        .overlay(
                            Circle()
                                .stroke(.white, lineWidth: 2)
                        )
                        .shadow(radius: 1)

                    Text(user.name)
                }
            }
        }
        .task {
            await fetchUsers()
        }
    }
    
    init(userStatus: UserStatus = .all, sortOrder: [SortDescriptor<User>]) {
       self.userStatus = userStatus
       self.sortOrder = sortOrder
       
       switch userStatus {
       case .online:
           _users = Query(filter: #Predicate<User> { $0.isActive }, sort: sortOrder)
       case .offline:
           _users = Query(filter: #Predicate<User> { $0.isActive == false }, sort: sortOrder)
       case .all:
           _users = Query(sort: sortOrder)
       }
   }
    
    func fetchUsers() async {
        // Do not fetch data if we already have it
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let downloadedUsers = try decoder.decode([User].self, from: data)
            let insertContext = ModelContext(modelContext.container)
            
            for user in downloadedUsers {
                insertContext.insert(user)
            }
            
            try insertContext.save()
        } catch {
            print("Download failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    UsersList(userStatus: .all, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}

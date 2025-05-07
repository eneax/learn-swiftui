//
//  ContentView.swift
//  Friendface
//
//  Created by Enea Xharja on 06.05.25.
//

import SwiftData
import SwiftUI

enum UserStatus: String, CaseIterable, Identifiable {
    case all = "Show All Friends"
    case online = "Online"
    case offline = "Offline"
    
    var id: String { rawValue }
}

struct ContentView: View {
    @State private var userStatus: UserStatus = .all

    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.registered),
    ]
    
    var body: some View {
        NavigationStack {
            UsersList(userStatus: userStatus, sortOrder: sortOrder)
                .navigationTitle("Friendface")
                .navigationDestination(for: User.self) { user in
                    UserView(user: user)
                }
                .toolbar {
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("User Status", selection: $userStatus) {
                            ForEach(UserStatus.allCases) { status in
                                Text(status.rawValue)
                                    .tag(status)
                            }
                        }
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort By", selection: $sortOrder) {
                            Text("Name (A-Z)")
                                .tag([
                                    SortDescriptor(\User.name),
                                    SortDescriptor(\User.registered)
                                ])

                            Text("Name (Z-A)")
                                .tag([
                                    SortDescriptor(\User.name, order: .reverse),
                                    SortDescriptor(\User.registered),
                                ])
                        }
                    }
                }
        }
    }
    
    
}

#Preview {
    ContentView()
}

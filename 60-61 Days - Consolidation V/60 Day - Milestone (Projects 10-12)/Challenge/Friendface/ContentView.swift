//
//  ContentView.swift
//  Friendface
//
//  Created by Enea Xharja on 06.05.25.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
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
            .navigationTitle("Friendface")
            .navigationDestination(for: User.self) { user in
                UserView(user: user)
            }
            .task {
                await fetchUsers()
            }
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
            
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Download failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Enea Xharja on 22.05.25.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    
    var body: some View {
        Button("Tap Me") {
            selectedUser = User()
        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
                .presentationDetents([.medium, .large])
        }
    }
}

//struct ContentView: View {
//    @State private var selectedUser: User? = nil
//    @State private var isShowingUser = false
//    
//    var body: some View {
//        Button("Tap Me") {
//            selectedUser = User()
//            isShowingUser = true
//        }
//        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//            Button(user.id) { }
//        }
//    }
//}

#Preview {
    ContentView()
}

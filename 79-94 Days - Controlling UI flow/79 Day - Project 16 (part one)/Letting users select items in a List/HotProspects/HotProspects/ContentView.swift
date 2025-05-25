//
//  ContentView.swift
//  HotProspects
//
//  Created by Enea Xharja on 15.05.25.
//

import SwiftUI

struct ContentView: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    @State private var selection = Set<String>()

    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        if selection.isEmpty == false {
            Text("Selected: \(selection.formatted())")
        }
        
        EditButton()
    }
}

#Preview {
    ContentView()
}

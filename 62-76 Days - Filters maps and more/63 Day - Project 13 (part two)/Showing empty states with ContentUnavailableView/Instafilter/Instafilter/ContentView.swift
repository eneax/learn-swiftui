//
//  ContentView.swift
//  Instafilter
//
//  Created by Enea Xharja on 07.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create snippet") {
                // create snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
}

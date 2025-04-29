//
//  ContentView.swift
//  Bookworm
//
//  Created by Enea Xharja on 29.04.25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            Text("TextEditor")
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
            
            Text("TextField")
            TextField("Enter your notes here", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}

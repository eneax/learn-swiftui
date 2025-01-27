//
//  ContentView.swift
//  WeSplit
//
//  Created by Enea Xharja on 24.01.25.
//

import SwiftUI

struct ContentView: View {
    // the property wrapper @State allows you to modify the immutable Struct
    @State private var tapCount = 0
    
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    // Whenever an @State property changes, Swift re-invokes the body property
    var body: some View {
        // Add navigation bar at the top
        NavigationStack {
            // Forms are scrolling lists of static and interactive controls
            Form {
                Picker("Select a student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) { // uniquely identify items in the array
                        Text($0)
                    }
                }
                // Sections split your form into visual chunks
                Section {
                    Text("Hello, world!")
                }
                
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                
                Button("Tap Count: \(tapCount)") {
                    tapCount += 1
                }
                
                // $ means read and write value automatically
                TextField("Enter your name", text: $name)
                Text("Your name is: \(name)")
                
                Section {
                    ForEach(0..<100) {
                        Text("Row \($0)")
                    }
                }
            }
            .navigationTitle("Select a Student")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

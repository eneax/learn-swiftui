//
//  ContentView.swift
//  WeSplit
//
//  Created by Enea Xharja on 22.03.25.
//

import SwiftUI

struct ContentView: View {
    let students = ["Hermione", "Ron", "Harry"]
    @State private var selectedStudent = "Hermione"
    @State private var tapCount = 0
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                }
                Button("Tap count: \(tapCount)") {
                    tapCount += 1
                }
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                Section {
                    ForEach(0..<3) { number in
                        Text("Row \(number + 1)")
                    }
                }
                Section {
                    ForEach(0..<3) {
                        Text("Row \($0)")
                    }
                }
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}

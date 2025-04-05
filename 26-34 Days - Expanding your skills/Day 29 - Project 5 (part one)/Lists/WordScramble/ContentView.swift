//
//  ContentView.swift
//  WordScramble
//
//  Created by Enea Xharja on 05.04.25.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        List {
//            Section("Section One") {
//                Text("Static 1")
//                Text("Static 2")
//            }
//            
//            Section("Section Two") {
//                ForEach(0..<3) {
//                    Text("Dynamic Row \($0)")
//                }
//            }
//            
//            Section("Section Three") {
//                Text("Static 3")
//                Text("Static 4")
//            }
//        }
//        .listStyle(.grouped)
//    }
    
    var body: some View {
        let people = ["Finn", "Leia", "Luke", "Rey"]

        List(people, id: \.self) {
            Text($0)
        }
    }
}

#Preview {
    ContentView()
}

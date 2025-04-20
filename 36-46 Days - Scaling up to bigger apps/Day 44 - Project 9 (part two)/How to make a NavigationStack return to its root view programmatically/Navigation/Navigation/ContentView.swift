//
//  ContentView.swift
//  Navigation
//
//  Created by Enea Xharja on 17.04.25.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { index in
                    DetailView(number: index, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Navigation
//
//  Created by Enea Xharja on 16.04.25.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Detail View \(number) initialized")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<1000) { number in
                NavigationLink("Tap Me") {
                    DetailView(number: number)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

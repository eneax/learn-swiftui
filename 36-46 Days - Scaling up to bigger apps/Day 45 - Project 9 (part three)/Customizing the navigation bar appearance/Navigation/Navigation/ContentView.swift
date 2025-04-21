//
//  ContentView.swift
//  Navigation
//
//  Created by Enea Xharja on 17.04.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { index in
                Text("Row \(index)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            .toolbar(.hidden)
        }
    }
}

#Preview {
    ContentView()
}

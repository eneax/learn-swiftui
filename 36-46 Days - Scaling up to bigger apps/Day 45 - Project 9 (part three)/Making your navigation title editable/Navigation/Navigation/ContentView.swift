//
//  ContentView.swift
//  Navigation
//
//  Created by Enea Xharja on 17.04.25.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "SwiftUI Navigation"
    
    var body: some View {
        NavigationStack {
            Text("Hello World!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

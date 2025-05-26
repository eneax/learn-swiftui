//
//  ContentView.swift
//  HotProspects
//
//  Created by Enea Xharja on 15.05.25.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(backgroundColor)
            
            Text("Change color")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: "checkmark.circle.fill", role: .destructive) {
                        backgroundColor = .red
                    }
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

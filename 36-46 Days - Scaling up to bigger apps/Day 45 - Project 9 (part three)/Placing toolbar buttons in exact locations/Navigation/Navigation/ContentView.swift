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
            Text("Hello, World!")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // some action
                        }
                        
                        Button("Or tap Me") {
                            // some action
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}

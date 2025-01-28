//
//  ContentView.swift
//  AlertMessages
//
//  Created by Enea Xharja on 28.01.25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important Message", isPresented: $showingAlert) {
            // buttons dismisses the alert automatically
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read the important message!")
        }
    }
}

#Preview {
    ContentView()
}

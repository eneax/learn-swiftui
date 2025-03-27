//
//  ContentView.swift
//  ShowingAlertMessages
//
//  Created by Enea Xharja on 26.03.25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .buttonStyle(.bordered)
        .alert("Important Message", isPresented: $showingAlert) {
//            Button("Ok") { }
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please review this important message.")
        }
    }
}

#Preview {
    ContentView()
}

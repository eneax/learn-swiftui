//
//  ContentView.swift
//  HotProspects
//
//  Created by Enea Xharja on 16.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Delete")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    ContentView()
}

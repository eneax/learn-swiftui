//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Enea Xharja on 14.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels([
            "John Fitzgerald Kennedy",
            "Kennedy",
            "JFK"
        ])
    }
}

#Preview {
    ContentView()
}

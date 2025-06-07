//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Enea Xharja on 20.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding(20)
            .background(.red)
    }
}

#Preview {
    ContentView()
}

/*
 - The Text view is a child of the background
 - Shapes and colors are layout neutral
 - Modifiers apply new views instead of changing the existing view
*/

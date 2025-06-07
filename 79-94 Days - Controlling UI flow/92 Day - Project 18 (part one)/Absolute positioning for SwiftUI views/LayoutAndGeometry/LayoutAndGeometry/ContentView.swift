//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Enea Xharja on 20.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Hello, world!")
//            .background(.red)
//            .position(x: 100, y: 100)
        
//        Text("Hello, world!")
//            .position(x: 100, y: 100)
//            .background(.red)
        
//        Text("Hello, world!")
//            .offset(x: 100, y: 100)
//            .background(.red)
        
        Text("Hello, world!")
            .background(.red)
            .offset(x: 100, y: 100)
    }
}

#Preview {
    ContentView()
}


/*
 When we use the offset() modifier, we're changing the location where a view should be rendered without actually changing its underlying geometry.
 
 This means when we apply background() afterwards it uses the original position of the text, not its offset.
*/

//
//  ContentView.swift
//  Instafilter
//
//  Created by Enea Xharja on 07.05.25.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
            
            Button("Random blur") {
                blurAmount = Double.random(in: 1...20)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

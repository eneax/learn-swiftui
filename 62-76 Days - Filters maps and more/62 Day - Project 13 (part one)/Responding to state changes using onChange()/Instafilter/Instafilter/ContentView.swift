//
//  ContentView.swift
//  Instafilter
//
//  Created by Enea Xharja on 07.05.25.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("New value is \(newValue)")
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Flashzilla
//
//  Created by Enea Xharja on 19.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Circle tapped")
                }
                .allowsHitTesting(false) // ignore taps on circle
        }
        .padding(.bottom, 30)
        
        VStack {
            Text("Hello")
            
            Spacer()
                .frame(height: 100)
            
            Text("World")
        }
        .border(.gray, width: 1)
        .contentShape(.rect) // makes the Spacer tappable
        .onTapGesture {
            print("VStack tapped")
        }
    }
}

#Preview {
    ContentView()
}

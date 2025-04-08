//
//  ContentView.swift
//  Animations
//
//  Created by Enea Xharja on 07.04.25.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack(spacing: 250) {
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(
                .easeInOut(duration: 2)
                .repeatForever(autoreverses: true),
                value: animationAmount
            )
            
            Button("Tap Me") { }
                .padding(50)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .stroke(.red)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeOut(duration: 1)
                            .repeatForever(autoreverses: false),
                            value: animationAmount
                        )
                )
                .onAppear {
                    animationAmount = 2
                }
        }
    }
}

#Preview {
    ContentView()
}

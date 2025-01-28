//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Enea Xharja on 27.01.25.
//

import SwiftUI

struct ContentView: View {
    func executeDelete() {
        print("Now deleting...")
    }
    
    var body: some View {
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//
//            Text("Hello, World!")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
        
        
//        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
        
        
//        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        
        
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
        
        
//        Text("Hello, World!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .foregroundStyle(.white)
//            .background(.red.gradient)
        
        VStack {
            Button("Button One") {}
                .buttonStyle(.bordered)
            
            Button("Button Two", role: .destructive, action: executeDelete)
                .buttonStyle(.bordered)
            
            Button("Button Three") {}
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
            
            Button("Button Four", role: .destructive) {}
                .buttonStyle(.borderedProminent)
            
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
            }
            
            Image(systemName: "pencil.circle")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            Button("Edit", systemImage: "pencil.circle") {
                print("Button was tapped")
            }
            
            Button {
                print("Button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil.circle")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }
    }
}

#Preview {
    ContentView()
}

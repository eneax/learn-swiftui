//
//  ContentView.swift
//  ButtonsAndImages
//
//  Created by Enea Xharja on 26.03.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Button 1") {}
                .buttonStyle(.bordered)
            
            Button("Button 2", role: .destructive) {}
                .buttonStyle(.bordered)
            
            Button("Button 1") {}
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
            
            Button("Button 2", role: .destructive) {}
                .buttonStyle(.borderedProminent)
            
            Button("Delete selection", action: executeDelete)
            
            Button {
                print("Button was tapped!")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            Image(systemName: "pencil.circle")
                .foregroundStyle(.red)
                .font(.largeTitle)
            
            Button("Edit", systemImage: "pencil") {
                print("Edit action triggered!")
            }
            
            Button {
                print("Cancel action triggered!")
            } label: {
                Label("Cancel", systemImage: "xmark")
                    .padding()
                    .background(.red)
                    .foregroundStyle(.white)
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting...")
    }
}

#Preview {
    ContentView()
}

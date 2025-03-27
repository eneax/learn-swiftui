//
//  ContentView.swift
//  ColorsAndGradients
//
//  Created by Enea Xharja on 26.03.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        ZStack() {
//            Color(red: 1, green: 0.8, blue: 0)
//            Text("One")
//        }
//        .ignoresSafeArea()
        
//        ZStack{
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//
//            Text("Content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
        
//        LinearGradient(stops: [
//            .init(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55)
//        ], startPoint: .top, endPoint: .bottom)
        
//        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
//            .ignoresSafeArea()
        
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
//            .ignoresSafeArea()
        
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.indigo.gradient)
    }
}

#Preview {
    ContentView()
}

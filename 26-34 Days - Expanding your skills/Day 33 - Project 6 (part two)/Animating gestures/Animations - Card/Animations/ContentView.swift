//
//  ContentView.swift
//  Animations
//
//  Created by Enea Xharja on 08.04.25.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged {
                        dragAmount = $0.translation
                    }
                    .onEnded { _ in
                        withAnimation(.bouncy) { // animates the release
                            dragAmount = .zero
                        }
                    }
            )
            // .animation(.bouncy, value: dragAmount) -> animates drag and release
    }
}

#Preview {
    ContentView()
}

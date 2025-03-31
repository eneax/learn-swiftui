//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Enea Xharja on 31.03.25.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleModifier())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Title")
                .titleStyle()
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Navigation
//
//  Created by Enea Xharja on 17.04.25.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { index in
                    NavigationLink("Select number \(index)", value: index)
                }
                
                ForEach(0..<5) { index in
                    NavigationLink("Select string \(index)", value: String(index))
                }
            }
            .toolbar {
                Button("Push Hello") {
                    path.append("Hello")
                }
                
                Button("Push 42") {
                    path.append(42)
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}

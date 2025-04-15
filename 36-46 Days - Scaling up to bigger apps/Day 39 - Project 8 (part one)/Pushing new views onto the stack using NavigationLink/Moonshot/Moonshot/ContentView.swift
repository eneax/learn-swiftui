//
//  ContentView.swift
//  Moonshot
//
//  Created by Enea Xharja on 14.04.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
//            NavigationLink {
//                Text("Detail View")
//            } label: {
//                VStack {
//                    Text("This is a label")
//                    Image(systemName: "face.smiling")
//                }
//                .font(.largeTitle)
//            }
            
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail View - Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}

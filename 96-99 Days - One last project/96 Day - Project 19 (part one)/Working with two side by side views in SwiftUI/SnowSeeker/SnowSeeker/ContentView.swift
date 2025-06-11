//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Enea Xharja on 22.05.25.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        NavigationSplitView {
//            NavigationLink("Primary") {
//                Text("New View")
//            }
//        } detail: {
//            Text("Content")
//                .toolbar(.hidden, for: .navigationBar)
//        }
//        .navigationSplitViewStyle(.balanced)
//    }
    
    var body: some View {
        // NavigationSplitView(columnVisibility: .constant(.all)) {
        NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
            NavigationLink("Primary") {
                Text("New View")
            }
        } detail: {
            Text("Content")
        }
        .navigationSplitViewStyle(.balanced) // show all views if you can
    }
}

#Preview {
    ContentView()
}

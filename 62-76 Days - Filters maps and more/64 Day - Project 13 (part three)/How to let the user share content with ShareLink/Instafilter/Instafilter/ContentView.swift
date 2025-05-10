//
//  ContentView.swift
//  Instafilter
//
//  Created by Enea Xharja on 08.05.25.
//

import SwiftUI

struct ContentView: View {
    let exampleImage = Image(.example)
    
    var body: some View {
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift"), message: Text("Check out the awesome Swift challenges on Hacking with Swift!"))
        
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
            Label("Spread the word!", systemImage: "swift")
        }
        
        ShareLink(item: exampleImage, preview: SharePreview("Singapore Airport", image: exampleImage)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ContentView()
}

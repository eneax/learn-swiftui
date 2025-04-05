//
//  ContentView.swift
//  WordScramble
//
//  Created by Enea Xharja on 05.04.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            // we found the file in our bundle!

            if let fileContent = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
                
                print(fileContent)
            }
        }
    }
}

#Preview {
    ContentView()
}

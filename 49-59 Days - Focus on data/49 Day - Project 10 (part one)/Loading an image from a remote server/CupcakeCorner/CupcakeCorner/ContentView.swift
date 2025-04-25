//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Enea Xharja on 22.04.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image { // success
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil { // error
                Text("There was an error loading the image.")
            } else { // loading
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView()
}

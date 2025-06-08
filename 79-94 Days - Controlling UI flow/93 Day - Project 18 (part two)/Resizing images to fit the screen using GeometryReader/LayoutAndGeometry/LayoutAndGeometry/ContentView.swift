//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Enea Xharja on 21.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        GeometryReader { proxy in // content aligned top-left by default
//            Image(.example)
//                .resizable()
//                .scaledToFit()
//                .frame(width: proxy.size.width * 0.8) // fill 80% of screen
//        }
        
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
            GeometryReader { proxy in
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height) // center content
            }
        }
    }
}

#Preview {
    ContentView()
}

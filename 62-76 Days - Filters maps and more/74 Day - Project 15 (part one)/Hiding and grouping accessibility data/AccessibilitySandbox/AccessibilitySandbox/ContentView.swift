//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Enea Xharja on 13.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Image(decorative: "character")
        
//        Image(.character)
//            .accessibilityHidden(true)
        
        VStack {
            Text("Your score is")
            
            Text("999")
                .font(.title)
        }
        .accessibilityElement(children: .combine)
        
        VStack {
            Text("Your score is")
            
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
    }
}

#Preview {
    ContentView()
}

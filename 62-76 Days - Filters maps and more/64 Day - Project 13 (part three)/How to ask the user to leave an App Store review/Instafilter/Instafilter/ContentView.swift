//
//  ContentView.swift
//  Instafilter
//
//  Created by Enea Xharja on 08.05.25.
//

import StoreKit
import SwiftUI

struct ContentView: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        VStack {
            Button("Leave a review") {
                requestReview()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

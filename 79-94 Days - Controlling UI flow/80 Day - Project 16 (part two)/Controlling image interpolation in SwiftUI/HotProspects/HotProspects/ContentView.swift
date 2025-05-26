//
//  ContentView.swift
//  HotProspects
//
//  Created by Enea Xharja on 15.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ContentView()
}

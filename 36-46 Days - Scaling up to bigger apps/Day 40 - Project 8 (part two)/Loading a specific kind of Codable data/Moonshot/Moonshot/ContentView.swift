//
//  ContentView.swift
//  Moonshot
//
//  Created by Enea Xharja on 14.04.25.
//

import SwiftUI

struct ContentView: View {
    let astrounauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astrounauts.count))
    }
}

#Preview {
    ContentView()
}

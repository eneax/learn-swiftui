//
//  ContentView.swift
//  HotProspects
//
//  Created by Enea Xharja on 16.05.25.
//

import SamplePackage
import SwiftUI

struct ContentView: View {
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        VStack {
            Text(results)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

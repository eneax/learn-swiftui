//
//  ContentView.swift
//  Moonshot
//
//  Created by Enea Xharja on 14.04.25.
//

import SwiftUI

struct ContentView: View {
    let astrounauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        Text("Astronauts \(String(astrounauts.count))")
        Text("Missions \(String(missions.count))")
    }
}

#Preview {
    ContentView()
}

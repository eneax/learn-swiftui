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
    
    @AppStorage("showinGrid") private var showingGrid = false
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astrounauts, missions: missions)
                } else {
                    ListLayout(astronauts: astrounauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Label("Show as table", systemImage: "list.dash")
                    } else {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

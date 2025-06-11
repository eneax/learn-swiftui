//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Enea Xharja on 22.05.25.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player
    
    var body: some View {
        // Text("High score: \(player.highScore)")
        
        @Bindable var player = player
        
        Stepper("High Score: \(player.highScore)", value: $player.highScore)
    }
}

struct ContentView: View {
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("Welcome!")
            HighScoreView()
        }
        .padding()
        .environment(player)
    }
}

#Preview {
    ContentView()
}

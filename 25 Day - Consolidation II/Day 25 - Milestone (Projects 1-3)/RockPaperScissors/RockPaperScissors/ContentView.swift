//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Enea Xharja on 01.04.25.
//

import SwiftUI

struct ContentView: View {
    private let moves = ["✊", "🖐", "✌️"]
    private var totalQuestions = 5
    
    @State private var computerChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var questionCount = 1
    @State private var showingResults = false
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .yellow]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Computer has played")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(moves[computerChoice])
                            .font(.system(size: 80))
                    }
                    
                    Text("Which one \(shouldWin ? "wins" : "loses")?")
                        .font(.title.weight(.semibold))
                    
                    HStack {
                        ForEach(0..<3) { number in
                            Button(moves[number]) {
                                play(choice: number)
                            }
                            .padding(10)
                            .font(.system(size: 60))
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Text("Questions: \(questionCount) / \(totalQuestions)")
                    .foregroundStyle(.secondary)
                    .font(.subheadline.weight(.heavy))
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over!", isPresented: $showingResults) {
            Button("New Game", action: resetGame)
        } message: {
            Text("Your score was: \(score)")
        }
    }
    
    func play(choice: Int) {
        let winningMoves = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = choice == winningMoves[computerChoice]
        } else {
            didWin = winningMoves[choice] == computerChoice
        }
        
        if didWin {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong!"
            
            if score > 0 {
                score -= 1
            }
        }
        
        if questionCount == totalQuestions {
            showingResults = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        computerChoice = Int.random(in: 0..<3)
        shouldWin.toggle()
        questionCount += 1
    }
    
    func resetGame() {
        computerChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        questionCount = 1
        score = 0
    }
}

#Preview {
    ContentView()
}

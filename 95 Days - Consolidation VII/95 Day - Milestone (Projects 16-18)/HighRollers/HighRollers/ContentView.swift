//
//  ContentView.swift
//  HighRollers
//
//  Created by Enea Xharja on 21.05.25.
//

import SwiftUI

struct ContentView: View {
    let diceTypes = [4, 6, 8, 10, 12, 20]
    
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @AppStorage("selectedDiceType") var selectedDiceType = 6
    @AppStorage("numberToRoll") var numberToRoll = 4
    
    @State private var currentResult = DiceResult(type: 0, number: 0)
    
    let columns: [GridItem] = [
        .init(.adaptive(minimum: 60))
    ]
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var stoppedDice = 0
    
    let savePath = URL.documentsDirectory.appending(path: "SavedRolls.json")
    @State private var savedResults = [DiceResult]()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("High Rollers")
                    .font(.largeTitle.bold())
                    .padding(.top)

                // Dice type selector
                HStack {
                    ForEach(diceTypes, id: \.self) { type in
                        Text("D\(type)")
                            .padding(10)
                            .background(selectedDiceType == type ? Color.accentColor : Color.gray.opacity(0.3))
                            .clipShape(.capsule)
                            .foregroundColor(.white)
                            .onTapGesture {
                                selectedDiceType = type
                            }
                    }
                    .disabled(stoppedDice < currentResult.rolls.count)
                }

                // Dice count
                Stepper(value: $numberToRoll, in: 1...20) {
                    Text("Number of dice: \(numberToRoll)")
                        .font(.headline)
                }
                .padding(.horizontal)
                .disabled(stoppedDice < currentResult.rolls.count)

                // Dice results grid
                if !currentResult.rolls.isEmpty {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(currentResult.rolls.indices, id: \.self) { index in
                            Text("\(currentResult.rolls[index])")
                                .font(.title2)
                                .frame(maxWidth: .infinity, minHeight: 60)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(radius: 2)
                        }
                    }
                    .padding(.horizontal)
                    .animation(.easeOut, value: currentResult.rolls)
                }

                // Roll Button
                Button(action: rollDice) {
                    Text("🎲 Roll Dice")
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal)
                .disabled(stoppedDice < currentResult.rolls.count)

                Spacer()


                // Previous Results
                if !savedResults.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Previous Rolls")
                            .font(.title2.bold())
                            .padding(.horizontal)

                        ScrollView {
                            VStack(spacing: 10) {
                                ForEach(savedResults) { result in
                                    HStack(alignment: .center, spacing: 16) {
                                        ZStack {
                                            Circle()
                                                .fill(Color.accentColor.opacity(0.1))
                                                .frame(width: 48, height: 48)

                                            Image(systemName: "dice.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.accentColor)
                                        }

                                        VStack(alignment: .leading, spacing: 6) {
                                            Text("\(result.number) x D\(result.type)")
                                                .font(.headline)
                                                .foregroundColor(.primary)

                                            Text(result.description)
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                                .lineLimit(2)
                                        }

                                        Spacer()
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(.ultraThinMaterial)
                                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                                    )
                                    .padding(.horizontal)
                                }
                            }
                            .padding(8)
                        }
                    }
                }
            }
            .padding(.bottom)
            .background(Color(.systemGroupedBackground))
            .onReceive(timer) { _ in updateDice() }
            .onAppear(perform: load)
            .sensoryFeedback(.impact, trigger: currentResult.rolls)
        }
    }
    
    func rollDice() {
        currentResult = DiceResult(type: selectedDiceType, number: numberToRoll)
        
        if accessibilityVoiceOverEnabled {
            stoppedDice = numberToRoll
            savedResults.insert(currentResult, at: 0)
            save()
        } else {
            stoppedDice = -20 // duration of the roll effect
        }
    }
    
    func updateDice() {
        guard stoppedDice < currentResult.rolls.count else { return }
        
        for i in stoppedDice..<numberToRoll {
            if i < 0 { continue }
            currentResult.rolls[i] = Int.random(in: 1...selectedDiceType)
        }
        
        stoppedDice += 1
        
        if stoppedDice == numberToRoll {
            savedResults.insert(currentResult, at: 0)
            save()
        }
    }
    
    func load() {
        if let data = try? Data(contentsOf: savePath) {
            if let results = try? JSONDecoder().decode([DiceResult].self, from: data) {
                savedResults = results
            }
        }
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(savedResults) {
            try? data.write(to: savePath, options: [.atomic, .completeFileProtection])
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Flashzilla
//
//  Created by Enea Xharja on 19.05.25.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled

    @State private var cards = DataManager.load()

    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    @State private var showingEditScreen = false
    
    @State private var correctAnswers = 0
    @State private var wrongAnswers = 0

    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()

            VStack {
                HStack {
                    Text("Time: \(timeRemaining)")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(.black.opacity(0.75))
                        .clipShape(.capsule)

                    Spacer()

                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.largeTitle)
                            .padding()
                            .background(.black.opacity(0.7))
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                    }
                }
                
                ZStack {
                    ForEach(Array(cards.enumerated()), id: \.element) { item in
                        CardView(card: item.element) { reinsert in
                           withAnimation {
                               removeCard(at: item.offset, reinsert: reinsert)
                           }
                        }
                        .stacked(at: item.offset, in: cards.count)
                        .allowsHitTesting(item.offset == cards.count - 1)
                        .accessibilityHidden(item.offset < cards.count - 1)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                
                if cards.isEmpty {
                    VStack(spacing: 15) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Results")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.white)
                            
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(.green)

                                Text("Correct: \(correctAnswers)")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }

                            HStack {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.red)

                                Text("Wrong: \(wrongAnswers)")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }

                            HStack {
                                Image(systemName: "clock.fill")
                                    .foregroundStyle(.yellow)

                                Text("Time Used: \(100 - timeRemaining)s")
                                    .font(.subheadline)
                                    .foregroundStyle(.white.opacity(0.8))
                            }
                        }
                        .padding()
                        .background(.black.opacity(0.7))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)

                        Button("Start Again", action: resetCards)
                            .padding()
                            .frame(minWidth: 150)
                            .background(.white)
                            .foregroundStyle(.black)
                            .clipShape(.capsule)
                    }
                    .transition(.scale)
                    .padding()
                }
            }

            if accessibilityDifferentiateWithoutColor || accessibilityVoiceOverEnabled {
                VStack {
                    Spacer()

                    HStack {
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1, reinsert: true)
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")

                        Spacer()

                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1, reinsert: false)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
                    }
                }
            }
        }
        .onReceive(timer) { time in
            guard isActive else { return }

            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                if cards.isEmpty == false {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: EditCards.init)
        .onAppear(perform: resetCards)
    }

    func removeCard(at index: Int, reinsert: Bool) {
        guard index >= 0 else { return }
        
        if reinsert {
            wrongAnswers += 1
            // move to the back of the deck
            cards.move(fromOffsets: IndexSet(integer: index), toOffset: 0)
        } else {
            correctAnswers += 1
            cards.remove(at: index)
        }

        if cards.isEmpty {
            isActive = false
        }
    }

    func resetCards() {
        timeRemaining = 100
        isActive = true
        correctAnswers = 0
        wrongAnswers = 0
        cards = DataManager.load()
    }
}

#Preview {
    ContentView()
}

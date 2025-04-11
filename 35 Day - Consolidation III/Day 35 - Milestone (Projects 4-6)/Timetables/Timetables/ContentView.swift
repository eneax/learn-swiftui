//
//  ContentView.swift
//  Timetables
//
//  Created by Enea Xharja on 11.04.25.
//

import SwiftUI

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(.thinMaterial)
            .clipShape(.rect(cornerRadius: 20))
    }
}

struct BottomInsetStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(.thinMaterial)
            .foregroundStyle(
                LinearGradient(
                    colors: [.red, .indigo, .blue],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .font(.custom("ChalkboardSE-Bold", size: 28))
    }
}

extension View {
    func cardStyle() -> some View {
        modifier(CardStyle())
    }
    
    func bottomInsetStyle() -> some View {
        modifier(BottomInsetStyle())
    }
}

struct ContentView: View {
    private let totalQuestions = [5, 10, 15, 20]
    
    @State private var selectedTable = 2
    @State private var selectedQuestions = 5
    
    @State private var score = 0
    @State private var questionCount = 0
    @State private var questions: [(Int, Int)] = []
    @State private var userAnswer = ""
    
    @State private var showingSettings = true
    @State private var showingFinalScore = false
    
    @FocusState private var isAnswerFieldFocused: Bool
    
    var body: some View {
        ZStack {
            AngularGradient(
                colors: [.red, .yellow, .green, .blue, .purple, .red],
                center: .center
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("📚 Timetables Quiz")
                    .font(.custom("ChalkboardSE-Bold", size: 32))
                    .foregroundStyle(.white)
                
                Spacer()
                
                if showingSettings {
                    VStack(spacing: 20) {
                        VStack(spacing: 15) {
                            Text("Choose a timetable (2-12)")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            
                            Text("\(selectedTable)")
                                .font(.system(size: 40))
                            
                            Stepper("\(selectedTable)", value: $selectedTable, in: 2...12, step: 1)
                                .labelsHidden()
                        }
                        .cardStyle()
                        
                        VStack(spacing: 15) {
                            Text("Choose the number of questions")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            
                            Picker("Number of questions", selection: $selectedQuestions) {
                                ForEach(totalQuestions, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        .cardStyle()
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                } else {
                    if questionCount < questions.count {
                        VStack(spacing: 15) {
                            Text("Question \(questionCount + 1) of \(selectedQuestions)")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            
                            Text("\(questions[questionCount].0) x \(questions[questionCount].1) = ?")
                                .font(.system(size: 40))
                            
                            TextField("Your answer", text: $userAnswer)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 32).bold())
                                .focused($isAnswerFieldFocused)
                        }
                        .cardStyle()
                        .id(questionCount)
                        .transition(.opacity.combined(with: .scale))
                        .animation(.easeInOut(duration: 0.3), value: questionCount)
                    } else {
                        Spacer()
                        
                        VStack(spacing: 15) {
                            Text("The End")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            
                            Text("Final score: \(score)")
                                .font(.system(size: 32))
                        }
                        .cardStyle()
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
            .padding()
            .onSubmit(play)
            .safeAreaInset(edge: .bottom) {
                if showingSettings {
                    Button("Start") {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            questions = generateQuestions()
                            showingSettings = false
                        }
                    }
                    .bottomInsetStyle()
                } else {
                    if showingFinalScore {
                        Button("New Game", action: resetGame)
                            .bottomInsetStyle()
                    } else {
                        Button("Submit", action: play)
                            .disabled(userAnswer.isEmpty || Int(userAnswer) == nil)
                            .bottomInsetStyle()
                    }
                }
            }
        }
    }
    
    func generateQuestions() -> [(Int, Int)] {
        var generatedQuestions: [(Int, Int)] = []
        var seenQuestions = Set<String>()

        while generatedQuestions.count < selectedQuestions {
            let randomNumber = Int.random(in: 1...12)
            let question = (selectedTable, randomNumber)

            let questionString = "\(question.0)x\(question.1)"

            if !seenQuestions.contains(questionString) {
                generatedQuestions.append(question)
                seenQuestions.insert(questionString)
            }
        }
        
        return generatedQuestions
    }
    
    func play() {
        guard questionCount < questions.count else {
            showingFinalScore = true
            return
        }
        
        let answer = Int(userAnswer)
        let correctAnswer = selectedTable * questions[questionCount].1
        
        if answer == correctAnswer {
            score += 1
        }
        
        withAnimation {
            questionCount += 1
        }
        
        if questionCount == selectedQuestions {
            showingFinalScore = true
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isAnswerFieldFocused = true
            }
        }
        
        userAnswer = ""
    }

    
    func resetGame() {
        questionCount = 0
        score = 0
        showingFinalScore = false
        selectedTable = 2
        selectedQuestions = 5
        showingSettings = true
        questions = []
    }
}

#Preview {
    ContentView()
}

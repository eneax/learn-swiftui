//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Enea Xharja on 31.01.25.
//

import SwiftUI

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct ContentView: View {
    @State private var useRedText = false
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        Button("Hello, world!") {
            print (type(of: self.body))
        }
        .frame(width: 100, height: 100)
        .background(.yellow)
        
        Button("Hi there!") {
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
        
        // environment modifier
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
        }
        .font(.title)
        
        // Views as properties
        motto1
            .foregroundStyle(.cyan)
        motto2
            .foregroundStyle(.green)
        spells
            .foregroundStyle(.red)
        
        // View composition
//        CapsuleText(text: "First")
//            .foregroundStyle(.white)
//        CapsuleText(text: "Second")
//            .foregroundStyle(.yellow)
        
        // Custom modifier
//        Text("Title 1")
//            .modifier(Title())
//
//        Text("Title 2")
//            .titleStyle()
//
//        Color.blue
//            .frame(width: 300, height: 100)
//            .watermarked(with: "SwiftUI")
        
        // Custom container
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row), C\(col)")
        }
    }
}

#Preview {
    ContentView()
}

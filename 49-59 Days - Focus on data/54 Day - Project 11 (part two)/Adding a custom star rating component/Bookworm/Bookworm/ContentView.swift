//
//  ContentView.swift
//  Bookworm
//
//  Created by Enea Xharja on 30.04.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var books: [Book]
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddView.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddView) {
                    AddBookView()
                }
        }
    }
}

#Preview {
    ContentView()
}

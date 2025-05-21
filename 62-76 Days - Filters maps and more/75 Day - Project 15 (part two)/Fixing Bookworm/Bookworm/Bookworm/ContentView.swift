//
//  ContentView.swift
//  Bookworm
//
//  Created by Enea Xharja on 30.04.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    @State private var showingAddView = false
    
    
    
    var body: some View {
        NavigationStack {
            List {
                let groupedBooks: [(label: String, books: [Book], isNotRecommended: Bool)] = [
                  ("Recommended", books.filter { $0.rating > 1 }, false),
                  ("Not Recommended", books.filter { $0.rating == 1 }, true)
                ]
                
                ForEach(groupedBooks, id: \.label) { section in
                    if !section.books.isEmpty {
                        Section(section.label) {
                            ForEach(section.books) { book in
                                BookRowView(book: book, isNotRecommended: section.isNotRecommended)
                            }
                            .onDelete(perform: deleteBooks)
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
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
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}

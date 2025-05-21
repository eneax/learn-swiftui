//
//  BookRowView.swift
//  Bookworm
//
//  Created by Enea Xharja on 02.05.25.
//

import SwiftData
import SwiftUI

struct BookRowView: View {
    @Environment(\.modelContext) var modelContext
    
    let book: Book
    let isNotRecommended: Bool
    
    var body: some View {
        NavigationLink(value: book) {
            HStack {
                EmojiRatingView(rating: book.rating)
                    .font(.largeTitle)
                
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    
                    Text(book.author)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        
        let example = Book(title: "Test title", author: "Test author", genre: "Fantasy", review: "Test review", rating: 4, date: .now)
        
        return BookRowView(book: example, isNotRecommended: false)
            .modelContainer(container)
    } catch {
        return Text("Failed to return preview: \(error.localizedDescription)")
    }
}

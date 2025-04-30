//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Enea Xharja on 30.04.25.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}

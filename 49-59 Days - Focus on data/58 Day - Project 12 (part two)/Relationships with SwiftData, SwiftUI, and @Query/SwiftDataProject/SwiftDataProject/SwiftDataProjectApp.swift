//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Enea Xharja on 03.05.25.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}

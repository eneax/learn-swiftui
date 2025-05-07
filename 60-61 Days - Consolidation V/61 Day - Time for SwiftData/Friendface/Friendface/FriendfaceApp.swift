//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Enea Xharja on 06.05.25.
//

import SwiftData
import SwiftUI

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}

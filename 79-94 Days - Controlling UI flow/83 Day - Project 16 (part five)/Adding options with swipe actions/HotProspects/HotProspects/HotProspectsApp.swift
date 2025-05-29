//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Enea Xharja on 16.05.25.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}

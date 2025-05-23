//
//  NameThatPhotoApp.swift
//  NameThatPhoto
//
//  Created by Enea Xharja on 14.05.25.
//

import SwiftData
import SwiftUI

@main
struct NameThatPhotoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Photo.self)
    }
}

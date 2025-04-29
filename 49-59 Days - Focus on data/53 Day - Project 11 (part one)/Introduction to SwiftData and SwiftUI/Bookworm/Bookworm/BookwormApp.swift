//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Enea Xharja on 29.04.25.
//

import SwiftData
import SwiftUI

@main // bootstrap the process of launching the app
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup { // app can be displayed in many windows
            ContentView()
        }
        .modelContainer(for: Student.self) // load the SwiftData model and setup its storage for us to use
    }
}

/*
 Model Container
 - It's SwiftData's name for where it stores its data.
 - The first time your app runs, SwiftData has to create the underlying database file.
 - In future runs it will load the database it made previously.
*/


/*
 Model Context
 - It represents the "live" version of your data.
 - When you load objects and change them, those changes only exist in memory (RAM) until they are saved (storage).
 - The job of the model context is to let us work with all our data in memory.
 - This approach is much faster than constantly reading and writing data to disk.
 
 - Every SwiftData app needs a model context to work with.
 - It's created automatically when we use the modelContainer() modifier.
 - SwiftData automatically creates one model context for us, called the "main context", and stores it in SwiftUI's environment.
*/

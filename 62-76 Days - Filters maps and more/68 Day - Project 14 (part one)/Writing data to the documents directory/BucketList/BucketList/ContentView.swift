//
//  ContentView.swift
//  BucketList
//
//  Created by Enea Xharja on 09.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Read and Write") {
            let data = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                
                // read back into a string
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ContentView()
}


/*
 Atomic writing:
 - it causes the system to write our full file to a temporary filename (not the one we asked for)
 - when that's finished it does a simple rename to our target filename.
 - This means either the whole file is there or nothing is.
 */


/*
 completeFileProtection:
 - Asking for complete file protection means iOS automatically (and transparently) encrypts the file
 - it only allows our app to read it while the device is unlocked
 */

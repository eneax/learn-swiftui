//
//  ContentView.swift
//  iExpense
//
//  Created by Enea Xharja on 12.04.25.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    ContentView()
}

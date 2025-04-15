//
//  ContentView.swift
//  Moonshot
//
//  Created by Enea Xharja on 14.04.25.
//

import SwiftUI

struct Address: Codable {
    let street: String
    let city: String
}

struct User: Codable {
    let name: String
    let address: Address
}

struct ContentView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """

            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

#Preview {
    ContentView()
}

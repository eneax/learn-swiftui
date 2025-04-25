//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Enea Xharja on 22.04.25.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 3 || email.isEmpty
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create Account") {
                    print("Creating account...")
                    username = ""
                    email = ""
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    ContentView()
}

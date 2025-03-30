//
//  ContentView.swift
//  Modifiers
//
//  Created by Enea Xharja on 30.03.25.
//

/*
 Notes
 - almost every time we apply a modifier to a SwiftUI view, we create a new view with that change applied
 - we don't just modify the existing view in place
 - the order of your modifiers matter
*/

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello, World!") {
            print(type(of: self.body))
        }
        // .background(.red)
        .frame(width: 200, height: 200)
        .background(.red)
        
        Text("Some text")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
        
        Button("Update color") {
            useRedText.toggle()
        }
        .padding()
        .foregroundStyle(useRedText ? .red : .blue)
        
        VStack {
            Text("Gryffindor")
                .font(.largeTitle.bold())
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  DatePicker
//
//  Created by Enea Xharja on 31.03.25.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            DatePicker("Please enter a date", selection: $wakeUp)
                .labelsHidden()
            
            DatePicker("Please enter the time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            
            // One-sided range (from now until a future date)
            DatePicker("Future date", selection: $wakeUp, in: Date.now...)
        }
        .padding()
    }
    
//    func exampleDates() {
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = Date.now...tomorrow
//    }
}

#Preview {
    ContentView()
}

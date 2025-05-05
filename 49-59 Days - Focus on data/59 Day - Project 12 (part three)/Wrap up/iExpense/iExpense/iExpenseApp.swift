//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Enea Xharja on 13.04.25.
//

import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}

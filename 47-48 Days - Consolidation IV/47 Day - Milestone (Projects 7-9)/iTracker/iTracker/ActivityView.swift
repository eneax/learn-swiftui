//
//  ActivityView.swift
//  iTracker
//
//  Created by Enea Xharja on 19.04.25.
//

import SwiftUI

struct ActivityView: View {
    var data: Activities
    var activity: Activity
    var onDelete: () -> Void
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            if activity.description.isEmpty == false {
                Section {
                    Text(activity.description)
                }
            }
            
            Section {
                Text("Completion count: \(activity.completionCount)")
                
                Button("Mark completed") {
                    var newActivity = activity
                    newActivity.completionCount += 1
                    
                    if let index = data.activities.firstIndex(of: activity) {
                        data.activities[index] = newActivity
                    }
                }
                
                Button("Delete Activity") {
                    onDelete()
                    dismiss()
                }
                .foregroundStyle(.red)
            }
        }
        .navigationTitle(activity.title)
    }
}

#Preview {
    ActivityView(data: Activities(), activity: .example, onDelete: { })
}

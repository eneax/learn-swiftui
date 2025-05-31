//
//  EmptyProspectsView.swift
//  HotProspects
//
//  Created by Enea Xharja on 18.05.25.
//

import SwiftUI

struct EmptyProspectsView: View {
    let filter: ProspectsView.FilterType
    
    var body: some View {
        switch filter {
            case .none:
                ContentUnavailableView(
                    "No Prospects",
                    systemImage: "qrcode.viewfinder",
                    description: Text("Tap the Scan button to add your first prospect.")
            )
                
            case .contacted:
                ContentUnavailableView(
                    "No One Contacted",
                    systemImage: "person.crop.circle.badge.xmark",
                    description: Text("Try reaching out to some of your prospects.")
                )
                
            case .uncontacted:
                ContentUnavailableView(
                    "Everyone Contacted",
                    systemImage: "checkmark.circle",
                    description: Text("Great job! All your prospects are contacted.")
                )
            }
    }
}

#Preview {
    EmptyProspectsView(filter: .none)
}

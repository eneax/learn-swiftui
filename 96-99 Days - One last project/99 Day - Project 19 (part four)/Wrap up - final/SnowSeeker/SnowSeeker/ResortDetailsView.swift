//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Enea Xharja on 23.05.25.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    
    var size: String {
        switch resort.size {
        case 1: "Small"
        case 2: "Average"
        default: "Large"
        }
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.caption.bold())
                
                Text(size)
                    .font(.subheadline)
            }
            
            VStack {
                Text("Price")
                    .font(.caption.bold())
                
                Text(price)
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ResortDetailsView(resort: .example)
}

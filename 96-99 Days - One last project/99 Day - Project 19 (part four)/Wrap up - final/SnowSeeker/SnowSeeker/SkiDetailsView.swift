//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Enea Xharja on 23.05.25.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort
    
    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                
                Text("\(resort.elevation)m")
                    .font(.subheadline)
            }
            
            VStack {
                Text("Snow")
                    .font(.caption.bold())
                
                Text("\(resort.snowDepth)cm")
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SkiDetailsView(resort: .example)
}

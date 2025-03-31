//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Enea Xharja on 31.03.25.
//

import SwiftUI

struct FlagImage: View {
    var name: String
    
    var body: some View {
        Image(name)
            .clipShape(.buttonBorder)
            .shadow(radius: 5)
    }
    
}

#Preview {
    FlagImage(name: "Italy")
}
